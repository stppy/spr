package py.gov.stp.mh.tools;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
/**
 * Un servlet que toma los detalles del mensaje provenientes del usuario
 * y lo envía como un nuevo e-mail a través del servidor SMTP.
 *
 * @author STP - DGTIC
 */
@WebServlet("/EmailSendingServlet")
public class EmailSendingServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String host;
    private String port;
    private String user;
    private String pass;
 
    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }
 
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // reads form fields
        String recipient = request.getParameter("remitente");
        String subject = request.getParameter("tema");
        String content = request.getParameter("texto");
        String nombreArchivoAdj = request.getParameter("nombreArchivoAdj"); //nombre del archivo alojado en el servidor.
        String urlArchivoAdj = null;
        
        //obtiene el path relativo de subida de archivos de la aplicación
        String savePath = getServletContext().getInitParameter("file-upload");
        //ajunta al nombre del archivo la url donde se alojan los archivos subidos en el servidor.
        if (nombreArchivoAdj != null) urlArchivoAdj = savePath + File.separator + nombreArchivoAdj;
        
        
        String resultMessage = "";
 
        try {
            SendMail.sendEmail(host, port, user, pass, recipient, subject,
                    content, nombreArchivoAdj, urlArchivoAdj);
            resultMessage = "El correo fue enviado exitosamente!;green";
        } catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "Se produjo un error al intentar enviar el correo.;red";
        } finally {
            request.setAttribute("Message", resultMessage);
            //request.getRequestDispatcher("emailResult.jsp").forward(request, response);
            //response.sendRedirect(request.getContextPath() + "/index.jsp");
            response.getWriter().write(resultMessage);
        }
    }
    
    
}