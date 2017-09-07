var dataFetcher = (function () {
    var cache = {};

    function ajaxGet(url) {
        return $.ajax({
            url: url,
            type: 'get',
            dataType: 'json'
        });
    }

    function cacheOrElse(url, callback, promise) {
        console.log(url);
        if (cache[url]) {
            promise.resolve(cache[url]);
        } else {
            ajaxGet(url).done(callback);
        }
    }

    function baseCallback(url, promise, attr) {
        return function (response) {
            var result = attr ? response[attr] : response;
            cache[url] = result;
            promise.resolve(result);
        }
    }


    function getTotalesEntidad(estrategia, eje, linea, condicion) {
        var url = 'http://spr.stp.gov.py/ajaxSelects?accion=getContadoresPNDporEntidad&estrategia=' + estrategia + '&eje=' + eje + '&linea=' + linea + condicion;
        var dfd = $.Deferred();
        cacheOrElse(url, baseCallback(url, dfd), dfd);
        return dfd;
    }

    function getTotalesObjetivos(estrategia, eje, linea, condicion) {
        var url = 'http://spr.stp.gov.py/ajaxSelects?accion=getContadoresPNDporObjetivos&estrategia=' + estrategia + '&eje=' + eje + '&linea=' + linea + condicion;
        var dfd = $.Deferred();
        cacheOrElse(url, baseCallback(url, dfd), dfd);
        return dfd;
    }

    function getObjetivosAbreviacion() {
        var url = 'http://spr.stp.gov.py/ajaxSelects?accion=getObjetivoAbreviacion';
        dfd = $.Deferred();
        cacheOrElse(url, baseCallback(url, dfd), dfd);
        return dfd;
    }

    function getProductos(estrategia, eje, linea, condicion) {
        var url = 'http://spr.stp.gov.py/ajaxSelects?accion=getPndProductos&estrategia=' + estrategia + '&eje=' + eje + '&linea=' + linea + condicion;
        var dfd = $.Deferred();
        var callback = function (response) {
            pndProductosContenido = response;
            var productosConcat = [];
            var productos = [];
            for (var i = 0; i < pndProductosContenido.length; i++) {
                if (productosConcat.indexOf(pndProductosContenido[i].prod_concat) < 0) {
                    productosConcat.push(pndProductosContenido[i].prod_concat);
                    var objeto = new Object();
                    objeto.prod_id = pndProductosContenido[i].prod_id;
                    objeto.concat = pndProductosContenido[i].prod_concat;
                    objeto.nombre = pndProductosContenido[i].producto_nombre;
                    objeto.clase = pndProductosContenido[i].producto_clase;
                    objeto.unidad_medida = pndProductosContenido[i].unidad_medida;
                    objeto.cantidad2017 = parseInt(0);
                    objeto.cantidad2018 = parseInt(0);
                    objeto.cantidad2019 = parseInt(0);
                    objeto.presupuesto = parseFloat(0.0);
                    if (pndProductosContenido[i].anho == "2017") {
                        objeto.cantidad2017 = pndProductosContenido[i].cantidad;
                        objeto.presupuesto = pndProductosContenido[i].presupuesto;
                    }
                    if (pndProductosContenido[i].anho == "2018") {
                        objeto.cantidad2018 = pndProductosContenido[i].cantidad;
                    }
                    if (pndProductosContenido[i].anho == "2019") {
                        objeto.cantidad2019 = pndProductosContenido[i].cantidad;
                    }
                    productos.push(objeto);
                } else {
                    if (productosConcat.indexOf(pndProductosContenido[i].prod_concat) >= 0) {
                        for (var j = 0; j < productos.length; j++) {
                            if (productos[j].concat == pndProductosContenido[i].prod_concat) {
                                if (pndProductosContenido[i].anho == "2017") {
                                    productos[j].cantidad2017 = pndProductosContenido[i].cantidad;
                                    productos[j].presupuesto += pndProductosContenido[i].presupuesto;
                                }
                                if (pndProductosContenido[i].anho == "2018") {
                                    productos[j].cantidad2018 = pndProductosContenido[i].cantidad;
                                }
                                if (pndProductosContenido[i].anho == "2019") {
                                    productos[j].cantidad2019 = pndProductosContenido[i].cantidad;
                                }

                            }
                        }
                    }
                }
            }
            cache[url] = productos;
            dfd.resolve(productos);
        }
        cacheOrElse(url, callback, dfd);
        return dfd;
    }

    function getFinanciamiento(estrategia, eje, linea, condicion) {
        var url = 'http://spr.stp.gov.py/ajaxSelects?accion=getPndFinanciamiento&estrategia=' + estrategia + '&eje=' + eje + '&linea=' + linea + condicion
        var dfd = $.Deferred();
        cacheOrElse(url, baseCallback(url, dfd), dfd);
        return dfd;
    }

    function getObjetoGastos() {
        var url = 'http://spr.stp.gov.py/ajaxSelects?accion=getObjetosDeGasto'
        var dfd = $.Deferred();
        cacheOrElse(url, baseCallback(url, dfd, 'objetosDeGasto'), dfd);
        return dfd;
    }

    return {
        'getTotalesEntidad': getTotalesEntidad,
        'getTotalesObjetivos': getTotalesObjetivos,
        'getObjetivosAbreviacion': getObjetivosAbreviacion,
        'getProductos': getProductos,
        'getFinanciamiento': getFinanciamiento,
        'getObjetoGastos': getObjetoGastos
    };
})();


var tableRenderer = (function () {
    function renderProductosTable(productos, id) {
        var text = '<div class="table-responsive">' +
            '	<table class="table table-striped table-bordered table-hover" id="dataTableProductos">' +
            '		<thead><th>Cód.</th><th>Productos</th><th>Clase</th><th>Unidad de Medida</th><th style="display:none;">Cantidad 2017 (oculto)</th><th>Cantidad 2017</th><th style="display:none;">Cantidad 2018 (oculto)</th><th>Cantidad 2018</th><th style="display:none;">Cantidad 2019 (oculto)</th><th>Cantidad 2019</th><th style="display:none;">Presupuesto</th><th>Presupuesto (Gs.)</th></thead>' +
            '		<tfoot><th></th><th></th><th></th><th></th><th></th><th style="display:none;"></th><th></th><th style="display:none;"></th><th></th><th style="display:none;"></th><th></th><th style="display:none;"></th></tfoot>' +
            '		<tbody>';

        var idParsed = "";
        for (var i = 0; i < productos.length; i++) {
            if (productos[i].presupuesto != null) {
                var productoPresupuesto = productos[i].presupuesto.toString();
                productoPresupuesto = productoPresupuesto.split(".");
                productoPresupuesto = parseFloat(productoPresupuesto);
            } else {
                productoPresupuesto = 0;
            }
            //text+='<tr><td>'+productos[i].concat+'</td><td><a href="../pndProductos.jsp?parametros='+eje+'-'+linea+'-'+estrategia+'-'+nivel+'-'+entidad+'" target="_blank" >'+productos[i].nombre+'</a></td><td>'+productos[i].clase+'</td><td>'+productos[i].unidad_medida+'</td><td>'+numeroConComa(productos[i].cantidad2017)+'</td><td>'+numeroConComa(productos[i].cantidad2018)+'</td><td>'+numeroConComa(productos[i].cantidad2019)+'</td><td class="text-right">'+numeroConComa(productos[i].presupuesto)+'</td></tr>';
            text += '<tr><td>' + productos[i].concat + '</td><td>' + productos[i].nombre + '</td><td>' + productos[i].clase + '</td><td>' + productos[i].unidad_medida + '</td><td class="text-right">' + numeroConComa(productos[i].cantidad2017) + '</td><td style="display:none;">' + productos[i].cantidad2017 + '</td><td class="text-right">' + numeroConComa(productos[i].cantidad2018) + '</td><td style="display:none;">' + productos[i].cantidad2018 + '</td><td class="text-right">' + numeroConComa(productos[i].cantidad2019) + '</td><td style="display:none;">' + productos[i].cantidad2019 + '</td><td class="text-right">' + numeroConComa(productos[i].presupuesto) + '</td><td class="text-right" style="display:none;">' + productoPresupuesto + '</td></tr>';
        }
        text += '		</tbody>' +
            '	</table>' +
            '</div>';
        $(id).html(text);


        $("#dataTableProductos").DataTable({
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'copy',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 5, 7, 9, 11]
                    }
                },
                {
                    extend: 'csv',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 5, 7, 9, 11]
                    }
                },
                {
                    extend: 'excel',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 5, 7, 9, 11]
                    }
                },
                {
                    extend: 'pdf',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 5, 7, 9, 11]
                    }
                },
                {
                    extend: 'print',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 5, 7, 9, 11]
                    }
                }
            ],
            "search": {
                "regex": true
            },
            "footerCallback": function (row, data, start, end, display) {
                var api = this.api(), data;
                // saca los puntos y <del> de la cadena para pasarlo a entero
                var intVal = function (i) {
                    if (typeof i === 'string') {
                        i = i.replace(/[\."<\/*del>""Gs\."]/g, '');
                        i = i.replace(/[","]/g, '.');
                        i = i * 1;
                    } else {
                        if (typeof i === 'number') {
                            i = i;
                        } else {
                            i = 0;
                        }
                    }
                    return i;
                };

                // total general para todas las paginas
                total10 = api
                    .column(10)
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // total por pagina
                pageTotal10 = api
                    .column(10, {page: 'current'})
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);


                $(api.column(10).footer()).html(
                    'Subtotal: ' + numeroConComa(pageTotal10) + ' (Total: ' + numeroConComa(total10) + ')'
                );
            },
            language: {
                buttons: {
                    copy: 'Copiar',
                    print: 'Imprimir'
                }
            }
        });
    }

    function renderEstructuraTable(entregas, monto, resultados, productos, clase, objetivos, id) {
        var content = renderEstructura(entregas, monto, resultados, productos, clase, objetivos);
        $(id).html(content);

        $("#dataTableProductosEst").DataTable({
            dom: 'Bfrtip',
            buttons: [
                'copy', 'csv', 'excel', 'pdf', 'print'
            ],
            "search": {
                "regex": true
            },
            "footerCallback": function (row, data, start, end, display) {
                var api = this.api(), data;
                // saca los puntos y <del> de la cadena para pasarlo a entero
                var intVal = function (i) {
                    if (typeof i === 'string') {
                        i = i.replace(/[\."<\/*del>""Gs\."]/g, '');
                        i = i.replace(/[","]/g, '.');
                        i = i * 1;
                    } else {
                        if (typeof i === 'number') {
                            i = i;
                        } else {
                            i = 0;
                        }
                    }
                    return i;
                };

                // total general para todas las paginas
                total2 = api
                    .column(2)
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // total por pagina 
                pageTotal2 = api
                    .column(2, {page: 'current'})
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // se muestran los valores de los totales en el footer del table
                $(api.column(2).footer()).html(
                    'Subtotal: ' + numeroConComa(pageTotal2) + ' (Total: ' + numeroConComa(total2) + ')'
                );
            },
            language: {
                buttons: {
                    copy: 'Copiar',
                    print: 'Imprimir'
                }
            }
        });
        $("#dataTableResultadosEst").DataTable({
            dom: 'Bfrtip',
            buttons: [
                'copy', 'csv', 'excel', 'pdf', 'print'
            ],
            "search": {
                "regex": true
            },
            language: {
                buttons: {
                    copy: 'Copiar',
                    print: 'Imprimir'
                }
            }
        });
        $("#dataTableObjetivosEst").DataTable({
            dom: 'Bfrtip',
            buttons: [
                'copy', 'csv', 'excel', 'pdf', 'print'
            ],
            "search": {
                "regex": true
            },
            language: {
                buttons: {
                    copy: 'Copiar',
                    print: 'Imprimir'
                }
            }
        });

    }

    function renderEntidadesTable(siglas, id) {
        var text = '<div class="table-responsive">' +
            '	<table class="table table-striped table-bordered table-hover" id="dataTableEntidades">' +
            '		<thead><th>Cód.</th><th>Entidad</th><th>Objetivos PND</th><th>Resultados</th><th>Tipos de Productos</th><th style="display:none">Entregas de Productos (oculto)</th><th>Entregas de Productos</th><th style="display:none">Presupuesto (oculto)</th><th>Presupuesto</th></thead>' +
            '		<tfoot><th>Total</th><th></th><th></th><th></th><th></th><th></th><th style="display:none;"></th><th></th><th style="display:none;"></th></tfoot>' +
            '		<tbody>';
        for (var i = 0; i < siglas.length; i++) {
            if (siglas[i].destinatarios != null) {
                var entDestinatarios = siglas[i].destinatarios.toString();
                entDestinatarios = entDestinatarios.split(".");
                entDestinatarios = parseFloat(entDestinatarios);
            } else {
                entDestinatarios = 0;
            }

            if (siglas[i].presupuesto != null) {
                var entPresupuesto = siglas[i].presupuesto.toString();
                entPresupuesto = entPresupuesto.split(".");
                entPresupuesto = parseFloat(entPresupuesto);
            } else {
                entPresupuesto = 0;
            }

            //text+='<tr><td>'+siglas[i].ne_concat+'</td><td><a href="../pndEntidades.jsp?parametros='+eje+'-'+linea+'-'+estrategia+'-'+nivel+'-'+entidad+' " target="_blank">'+siglas[i].entidad_nombre+'</a></td><td>'+numeroConComa(siglas[i].objetivos)+'</td><td>'+numeroConComa(siglas[i].resultados)+'</td><td>'+numeroConComa(siglas[i].productos)+'</td><td>'+numeroConComa(siglas[i].destinatarios)+'</td><td class="text-right">'+numeroConComa(siglas[i].presupuesto)+'</td></tr>';
            text += '<tr><td>' + siglas[i].ne_concat + '</td><td>' + siglas[i].entidad_nombre + '</td><td>' + numeroConComa(siglas[i].objetivos) + '</td><td>' + numeroConComa(siglas[i].resultados) + '</td><td>' + numeroConComa(siglas[i].productos) + '</td><td class="text-right">' + numeroConComa(entDestinatarios) + '</td><td style="display:none;">' + entDestinatarios + '</td><td class="text-right">' + numeroConComa(entPresupuesto) + '</td><td style="display:none;">' + entPresupuesto + '</td></tr>';
        }
        text += '		</tbody>' +
            '	</table>' +
            '</div>';
        $(id).html(text);

        $("#dataTableEntidades").DataTable({
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'copy',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 6, 8]
                    }
                },
                {
                    extend: 'csv',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 6, 8]
                    }
                },
                {
                    extend: 'excel',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 6, 8]
                    }
                },
                {
                    extend: 'pdf',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 6, 8]
                    }
                },
                {
                    extend: 'print',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 6, 8]
                    }
                }
            ],
            "search": {
                "regex": true
            },
            "footerCallback": function (row, data, start, end, display) {
                var api = this.api(), data;
                // saca los puntos y <del> de la cadena para pasarlo a entero
                var intVal = function (i) {
                    if (typeof i === 'string') {
                        i = i.replace(/[\."<\/*del>""Gs\."]/g, '');
                        i = i.replace(/[","]/g, '.');
                        i = i * 1;
                    } else {
                        if (typeof i === 'number') {
                            i = i;
                        } else {
                            i = 0;
                        }
                    }
                    return i;
                };

                // total general para todas las paginas
                total5 = api
                    .column(5)
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // total por pagina
                pageTotal5 = api
                    .column(5, {page: 'current'})
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // total general para todas las paginas
                total7 = api
                    .column(7)
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // total por pagina
                pageTotal7 = api
                    .column(7, {page: 'current'})
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                $(api.column(5).footer()).html(
                    'Subtotal: ' + numeroConComa(pageTotal5) + ' (Total: ' + numeroConComa(total5) + ')'
                );
                $(api.column(7).footer()).html(
                    'Subtotal: ' + numeroConComa(pageTotal7) + ' (Total: ' + numeroConComa(total7) + ')'
                );
            },
            language: {
                buttons: {
                    copy: 'Copiar',
                    print: 'Imprimir'
                }
            }
        });

    }

    function renderObjetivosTable(objetivos, objetivosAbreviacion, id) {
        var text = '<div class="table-responsive">' +
            '	<table class="table table-striped table-bordered table-hover" id="dataTableResultados">' +
            '		<thead><th>Id</th><th>Objetivos PND</th><th>Entidades</th><th>Resultados</th><th>Tipos de Productos</th><th style="display:none">Entregas de Productos (oculto)</th><th>Entregas de Productos</th><th style="display:none">Presupuesto (oculto)</th><th >Presupuesto</th></thead>' +
            '		<tfoot><th></th><th></th><th></th><th></th><th></th><th></th><th style="display:none;"></th><th></th><th style="display:none;"></th></tfoot>' +
            '		<tbody>';
        objetivos = objetivos.sort(comparePresupuesto);
        for (var i = 0; i < objetivos.length; i++) {
            if (objetivos[i].presupuesto != null) {
                var presupuesto = objetivos[i].presupuesto.toString();
                presupuesto = presupuesto.split(".");
                presupuesto = parseFloat(presupuesto);
            } else {
                presupuesto = 0;
            }
            var cantDestinatarios;
            if (objetivos[i].destinatarios != null) {
//						 var cantDestinatarios = objetivos[i].destinatarios.toString();
//						 cantDestinatarios = cantDestinatarios.split(".");
                if (objetivos[i].resultado_colaboracion > 0)
                    cantDestinatarios = parseFloat(cantDestinatarios * objetivos[i].producto_colaboracion * objetivos[i].resultado_colaboracion);
                else
                    cantDestinatarios = parseFloat(cantDestinatarios * objetivos[i].producto_colaboracion);
            } else {
                cantDestinatarios = 0;
            }
            //text+='<tr><td><a href="../pndObjetivos.jsp?parametros='+eje+'-'+linea+'-'+estrategia+'-'+nivel+'-'+entidad+' " target="_blank">'+objetivos[i].objetivo_estrategico_nombre+'</a></td><td>'+numeroConComa(objetivos[i].entidades)+'</td><td>'+numeroConComa(objetivos[i].resultados)+'</td><td>'+numeroConComa(objetivos[i].productos)+'</td><td>'+numeroConComa(objetivos[i].destinatarios)+'</td><td class="text-right">'+numeroConComa(presupuesto)+'</td><td style="display:none">'+presupuesto+'</td></tr>';
            var posObjAv = objetivosAbreviacion.map(function (o) {
                return o.id;
            }).indexOf(objetivos[i].objetivo_estrategico_id);
            text += //'<tr><td>'+objetivos[i].objetivo_estrategico_nombre+'</td>'+
                '<tr><td>' + objetivos[i].objetivo_estrategico_id + '</td>' +
                '<td>' + objetivosAbreviacion[posObjAv].nombre + '</td>' +
                '<td>' + numeroConComa(objetivos[i].entidades) + '</td>' +
                '<td>' + numeroConComa(objetivos[i].resultados) + '</td>' +
                '<td>' + numeroConComa(objetivos[i].productos) + '</td>' +
                '<td class="text-right">' + numeroConComa(objetivos[i].destinatarios) + '</td>' +
                '<td style="display:none;">' + numeroConComa(objetivos[i].destinatarios) + '</td>' +
                '<td class="text-right">' + numeroConComa(presupuesto) + '</td>' +
                '<td style="display:none;">' + presupuesto + '</td></tr>';
        }
        text += '		</tbody>' +
            '	</table>' +
            '</div>';
        $(id).html(text);

        var cuerpoTablaObjetivos = '<div class="box-body"><div> <p>' + text + ' </p></div></div>';
        $("#tablaObjetivos").append(cuerpoTablaObjetivos);

        $("#dataTableResultados").DataTable({
            dom: 'Bfrtip',
            "order": [[7, "desc"]],
            buttons: [
                {
                    extend: 'copy',
                    exportOptions: {
                        columns: [1, 2, 3, 4, 6, 8]
                    }
                },
                {
                    extend: 'csv',
                    exportOptions: {
                        columns: [1, 2, 3, 4, 6, 8]
                    }
                },
                {
                    extend: 'excel',
                    exportOptions: {
                        columns: [1, 2, 3, 4, 6, 8]
                    }
                },
                {
                    extend: 'pdf',
                    exportOptions: {
                        columns: [1, 2, 3, 4, 6, 8]
                    }
                },
                {
                    extend: 'print',
                    exportOptions: {
                        columns: [1, 2, 3, 4, 6, 8]
                    }
                }
            ],
            "search": {
                "regex": true
            },
            "footerCallback": function (row, data, start, end, display) {
                var api = this.api(), data;
                // saca los puntos y <del> de la cadena para pasarlo a entero
                var intVal = function (i) {
                    if (typeof i === 'string') {
                        i = i.replace(/[\."<\/*del>""Gs\."]/g, '');
                        i = i.replace(/[","]/g, '.');
                        i = i * 1;
                    } else {
                        if (typeof i === 'number') {
                            i = i;
                        } else {
                            i = 0;
                        }
                    }
                    return i;
                };

                // total general para todas las paginas
                total5 = api
                    .column(5)
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // total por pagina 
                pageTotal5 = api
                    .column(5, {page: 'current'})
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // total general para todas las paginas
                total7 = api
                    .column(7)
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // total por pagina 
                pageTotal7 = api
                    .column(7, {page: 'current'})
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                $(api.column(5).footer()).html(
                    'Subtotal: ' + numeroConComa(pageTotal5) + ' (Total: ' + numeroConComa(total5) + ')'
                );

                $(api.column(7).footer()).html(
                    'Subtotal: ' + numeroConComa(pageTotal7) + ' (Total: ' + numeroConComa(total7) + ')'
                );
            },
            language: {
                buttons: {
                    copy: 'Copiar',
                    print: 'Imprimir'
                }
            }
        });

    }

    function renderFinanciamiento(pndFinanciamiento, objetoGastos, id) {

        /*************************** Funciones para tab Gastos ***************************/
        /*************************** CENTENA ***************************/
        var finan = [];//array de concats
        var financiamientos = [];//array de objetos
        var objetoGastosFiltrados = [];//array de gastos filtrados
        var index;

        for (var i = 0; i < objetoGastos.length; i++) {
            var objetoGasto = new Object();
            if (objetoGastos[i].codObjetoGasto % 100 == 0) {
                objetoGasto.objetoGastoId = objetoGastos[i].codObjetoGasto;
                objetoGasto.objetoGastoNombre = objetoGastos[i].nombre;
                objetoGastosFiltrados.push(objetoGasto);
            }
        }

        if (pndFinanciamiento != null) {
            for (var i = 0; i < pndFinanciamiento.length; i++) {
                var financiamiento = new Object();
                index = "";
                index = index.concat(pndFinanciamiento[i].fuente_financiamiento_id, '-', pndFinanciamiento[i].organismo_financiador_id, '-', ((Math.floor(pndFinanciamiento[i].objeto_gasto_id / 100)) * 100));
                if (finan.indexOf(index) < 0) {
                    financiamiento.fuenteFinanciamiento = pndFinanciamiento[i].fuente_financiamiento;
                    financiamiento.organismoFinanciador = pndFinanciamiento[i].organismo_financiador;
                    financiamiento.objetoGasto = pndFinanciamiento[i].objeto_gasto;
                    financiamiento.fuenteFinanciamientoId = pndFinanciamiento[i].fuente_financiamiento_id;
                    financiamiento.organismoFinanciadorId = pndFinanciamiento[i].organismo_financiador_id;
                    financiamiento.objetoGastoId = ((Math.floor(pndFinanciamiento[i].objeto_gasto_id / 100)) * 100);
                    for (var j = 0; j < objetoGastosFiltrados.length; j++) {
                        if (objetoGastosFiltrados[j].objetoGastoId == financiamiento.objetoGastoId) {
                            financiamiento.objetoGastoNombre = objetoGastosFiltrados[j].objetoGastoNombre;
                            break;
                        }
                    }
                    financiamiento.presupuesto = parseFloat(pndFinanciamiento[i].presupuesto) * parseFloat(pndFinanciamiento[i].colaboracion_resultado) * parseFloat(pndFinanciamiento[i].colaboracion_producto);
                    financiamientos.push(financiamiento);
                    finan.push(index);
                } else {
                    for (var j = 0; j < financiamientos.length; j++) {
                        if (financiamientos[j].fuenteFinanciamientoId == pndFinanciamiento[i].fuente_financiamiento_id &&
                            financiamientos[j].organismoFinanciadorId == pndFinanciamiento[i].organismo_financiador_id &&
                            financiamientos[j].objetoGastoId == (Math.floor(pndFinanciamiento[i].objeto_gasto_id / 100)) * 100)
                            financiamientos[j].presupuesto = parseFloat(financiamientos[j].presupuesto) + (parseFloat(pndFinanciamiento[i].presupuesto) * parseFloat(pndFinanciamiento[i].colaboracion_resultado) * parseFloat(pndFinanciamiento[i].colaboracion_producto));
                    }
                }
            }
        }
        /*************************** DECENA ***************************/
        var finanDec = [];//array de concats
        var financiamientosDec = [];//array de objetos
        var objetoGastosXDecenas = [];//array de gastos filtrados por decenas
        var indexDec;

        for (var d = 0; d < objetoGastos.length; d++) {
            var objetoGastoDec = new Object();
            if (objetoGastos[d].codObjetoGasto % 10 == 0) {
                objetoGastoDec.objetoGastoId = objetoGastos[d].codObjetoGasto;
                objetoGastoDec.objetoGastoNombre = objetoGastos[d].nombre;
                objetoGastosXDecenas.push(objetoGastoDec);
            }
        }

        if (pndFinanciamiento != null) {
            for (var p = 0; p < pndFinanciamiento.length; p++) {
                var financiamientoDec = new Object();
                indexDec = "";
                indexDec = indexDec.concat(pndFinanciamiento[p].fuente_financiamiento_id, '-', pndFinanciamiento[p].organismo_financiador_id, '-', ((Math.floor(pndFinanciamiento[p].objeto_gasto_id / 10)) * 10));
                if (finanDec.indexOf(indexDec) < 0) {
                    financiamientoDec.fuenteFinanciamiento = pndFinanciamiento[p].fuente_financiamiento;
                    financiamientoDec.organismoFinanciador = pndFinanciamiento[p].organismo_financiador;
                    financiamientoDec.objetoGastoDec = pndFinanciamiento[p].objeto_gasto;
                    financiamientoDec.fuenteFinanciamientoId = pndFinanciamiento[p].fuente_financiamiento_id;
                    financiamientoDec.organismoFinanciadorId = pndFinanciamiento[p].organismo_financiador_id;
                    financiamientoDec.objetoGastoId = ((Math.floor(pndFinanciamiento[p].objeto_gasto_id / 10)) * 10);
                    for (var k = 0; k < objetoGastosXDecenas.length; k++) {
                        if (objetoGastosXDecenas[k].objetoGastoId == financiamientoDec.objetoGastoId) {
                            financiamientoDec.objetoGastoNombre = objetoGastosXDecenas[k].objetoGastoNombre;
                            break;
                        }
                    }
                    financiamientoDec.presupuestoDec = parseFloat(pndFinanciamiento[p].presupuesto) * parseFloat(pndFinanciamiento[p].colaboracion_resultado) * parseFloat(pndFinanciamiento[p].colaboracion_producto);
                    financiamientosDec.push(financiamientoDec);
                    finanDec.push(indexDec);
                } else {
                    for (var m = 0; m < financiamientosDec.length; m++) {
                        if (financiamientosDec[m].fuenteFinanciamientoId == pndFinanciamiento[p].fuente_financiamiento_id &&
                            financiamientosDec[m].organismoFinanciadorId == pndFinanciamiento[p].organismo_financiador_id &&
                            financiamientosDec[m].objetoGastoId == (Math.floor(pndFinanciamiento[p].objeto_gasto_id / 10)) * 10)
                            financiamientosDec[m].presupuestoDec = parseFloat(financiamientosDec[m].presupuestoDec) + (parseFloat(pndFinanciamiento[p].presupuesto) * parseFloat(pndFinanciamiento[p].colaboracion_resultado) * parseFloat(pndFinanciamiento[p].colaboracion_producto));
                    }
                }
            }
        }
        /*************************** UNIDAD ***************************/
        var finanUni = [];//array de concats
        var financiamientosUnidad = [];//array de objetos sin filtro
        var objetoGastosXUnidad = [];//array de gastos sin filtrar
        var indexUni;

        for (var u = 0; u < objetoGastos.length; u++) {
            var objetoGastoUnitario = new Object();

            objetoGastoUnitario.objetoGastoId = objetoGastos[u].codObjetoGasto;
            objetoGastoUnitario.objetoGastoNombre = objetoGastos[u].nombre;
            objetoGastosXUnidad.push(objetoGastoUnitario);

        }


        if (pndFinanciamiento != null) {
            for (var q = 0; q < pndFinanciamiento.length; q++) {
                var financiamientoUnidad = new Object();
                indexUni = "";
                indexUni = indexUni.concat(pndFinanciamiento[q].fuente_financiamiento_id, '-', pndFinanciamiento[q].organismo_financiador_id, '-', pndFinanciamiento[q].objeto_gasto_id);
                if (finanUni.indexOf(indexUni) < 0) {
                    financiamientoUnidad.fuenteFinanciamiento = pndFinanciamiento[q].fuente_financiamiento;
                    financiamientoUnidad.organismoFinanciador = pndFinanciamiento[q].organismo_financiador;
                    financiamientoUnidad.objetoGastoUni = pndFinanciamiento[q].objeto_gasto;
                    financiamientoUnidad.fuenteFinanciamientoId = pndFinanciamiento[q].fuente_financiamiento_id;
                    financiamientoUnidad.organismoFinanciadorId = pndFinanciamiento[q].organismo_financiador_id;
                    financiamientoUnidad.objetoGastoId = pndFinanciamiento[q].objeto_gasto_id;
                    for (var n = 0; n < objetoGastosXUnidad.length; n++) {
                        if (objetoGastosXUnidad[n].objetoGastoId == financiamientoUnidad.objetoGastoId) {
                            financiamientoUnidad.objetoGastoNombre = objetoGastosXUnidad[n].objetoGastoNombre;
                            break;
                        }
                    }
                    financiamientoUnidad.presupuestoUnitario = parseFloat(pndFinanciamiento[q].presupuesto) * parseFloat(pndFinanciamiento[q].colaboracion_resultado) * parseFloat(pndFinanciamiento[q].colaboracion_producto);

                    financiamientosUnidad.push(financiamientoUnidad);
                    finanUni.push(indexUni);
                } else {
                    for (var o = 0; o < financiamientosUnidad.length; o++) {
                        if (financiamientosUnidad[o].fuenteFinanciamientoId == pndFinanciamiento[q].fuente_financiamiento_id &&
                            financiamientosUnidad[o].organismoFinanciadorId == pndFinanciamiento[q].organismo_financiador_id &&
                            financiamientosUnidad[o].objetoGastoId == pndFinanciamiento[q].objeto_gasto_id)
                            financiamientosUnidad[o].presupuestoUnitario = parseFloat(financiamientosUnidad[o].presupuestoUnitario) + (parseFloat(pndFinanciamiento[q].presupuesto) * parseFloat(pndFinanciamiento[q].colaboracion_resultado) * parseFloat(pndFinanciamiento[q].colaboracion_producto));
                    }
                }
            }
        }

        var text = renderGastos(financiamientos, financiamientosDec, financiamientosUnidad, objetoGastosFiltrados, objetoGastosXDecenas, objetoGastosXUnidad);
        $(id).html(text);

        //EVENTO DE CHANGE DEL SELECTOR DE GRUPOS DE GASTOS.
        $("body").on("click", "#verTablaDecena",function(event){
            $("#tablaAgrupado").hide("slow");
            $("#tablaXDecena").removeClass('hidden');
            $("#tablaXDecena").show("slow");
            $("#tablaXUnidad").hide("slow");
        });
        $("body").on("click", "#verTablaUnidad",function(event){
            $("#tablaAgrupado").hide("slow");
            $("#tablaXDecena").hide("slow");
            $("#tablaXUnidad").removeClass('hidden');
            $("#tablaXUnidad").show("slow");
        });
        $("body").on("click", "#verTablaAgrupado",function(event){
            $("#tablaAgrupado").show("slow");
            $("#tablaXDecena").hide("slow");
            $("#tablaXUnidad").hide("slow");
        });

    }

    return {
        'renderProductosTable': renderProductosTable,
        'renderEstructuraTable': renderEstructuraTable,
        'renderEntidadesTable': renderEntidadesTable,
        'renderObjetivosTable': renderObjetivosTable,
        'renderFinanciamiento': renderFinanciamiento
    }
})();