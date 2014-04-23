 while(ciclo.next()){
                String rut2 = ciclo.getString("rut");
                String password3 = ciclo.getString("contraseña");
                String tipo = ciclo.getString("tipo");
                if(rut.equals(rut) && password2.equals(password3)){
                    if(tipo.equals("Administrador")){
                    %><script language="JavaScript">
                        location.href="inicioadmin.jsp";
                                        </script><%
                    }
                    else if(tipo.equals("Vendedor")){
                        %><script language="JavaScript">
                            location.href="iniciovendedor.jsp";
                                                    </script><%
                    }
                }
             }
                
                   
            if(rut == "" || password2 == ""){
                %><script language="JavaScript">
                    alert("hay una casilla vacia, porfavor vuelva a ingresar");
                    location.href="index.jsp";
                                </script><%
            }
            
            else{
                %><script language="JavaScript">
                    alert("Datos erroneos, vuelva a ingresar");
                    location.href="index.jsp";
                                </script><%
            }*/