var dataFetcher = (function () {

    function ajaxGet(url) {
        return $.ajax({
            url: url,
            type: 'get',
            dataType: 'json'
        });
    }

    function getTotalesEntidad(estrategia, eje, linea, condicion) {
        var url = 'http://spr.stp.gov.py/ajaxSelects?accion=getContadoresPNDporEntidad&estrategia=' + estrategia + '&eje=' + eje + '&linea=' + linea + condicion;
        return ajaxGet(url);
    }

    function getProductos(estrategia, eje, linea, condicion) {
        var url = 'http://spr.stp.gov.py/ajaxSelects?accion=getPndProductos&estrategia=' + estrategia + '&eje=' + eje + '&linea=' + linea + condicion;
        console.log(url);
        var dfd = $.Deferred();
        ajaxGet(url).done(function (response) {
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
            dfd.resolve(productos);
        });
        return dfd;
    }

    return {
        'getTotalesEntidad': getTotalesEntidad,
        'getProductos': getProductos
    };
})();


var tableRenderer = (function () {
    function renderProductosTable() {
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

    return {'renderProductosTable': renderProductosTable}
})();