TPL - Práctica adicional. Ejercicios intérprete de comandos linux
=================================================================

**Objetivo:**
Familiarizarse con el uso del intérprete de comandos en s.o. Linux.

**Conceptos básicos que el alumno debe asimilar:**

* Manejo básico de interfaz de usuario (redirecciones, canalizaciones).

* Creación y mantenimiento de cuentas de usuarios.

* Estructura del sistema de archivos.

* Gerenciamiento del sistema de archivos.

* Gerenciamiento de procesos. Manejo de shell scripts.


**Lista de ejercicios sugeridos:**

1. ¿Cómo se puede obtener ayuda e información en el sistema?.

2. ¿Cuáles son los atributos que posee un archivo o directorio?. ¿Qué comando se utiliza para ver dicha información?

3. ¿Cuáles son los directorios usuales en LINUX y que contienen a nivel general?.

4. ¿Qué es un enlace (`link`), y cuales son las diferencias entre un enlace duro y uno blando?. ¿Cómo se implementan?

5. ¿Cuáles son los atributos asociados a cada proceso?.

6. Ingresar al sistema como usuario `root`.

7. Crear un grupo de usuarios llamado `grupo1`. (addgroup)

8. Crear una cuenta para el usuario `abelardo`, asignándole como password `ksj1jh7`, directorio de trabajo `/home/abel1`, grupo de trabajo `grupo1` y el intérprete de comandos csh. (adduser)

9. Crear una cuenta para el usuario `felisa`, directorio de trabajo por defecto, grupo de trabajo `grupo1` y `bash` como shell.

10. Asignar la clave `isj6Mhsa` al usuario felisa. (addsuer)

11. En otra terminal ingresar al sistema como usuario `abelardo`.

12. Crear un archivo llamado `arch1` de al menos 10 líneas de texto utilizando el comando `cat`.

13. Modificar los permisos de acceso de `arch1` de manera que sólo pueda ser leído por el usuario `abelardo`. (chmod)

14. Ordenar alfabéticamente el archivo `arch1` y guardar el resultado en `arch2`. (sort)

15. Copiar el contenido de `arch2` en otro archivo `arch3` con las líneas numeradas. (cat)

16. Eliminar el archivo `arch2` y volver a crearlo a partir del archivo  `arch3`. (rm, cut)

17. Fijar la fecha de modificación del archivo `arch3` igual a la del archivo `arch1`. (touch)

18. Crear un archivo llamado `arch4` que contenga las primeras 2 líneas (sin encabezados) de los archivos `arch1`, `arch2` y `arch3`. (head)

19. Pasar a modo superusuario. (su)

20. Modificar `arch4` para que el nuevo dueño y grupo sea `root`, y pueda ser leído por todos los usuarios del sistema pero sólo modificado por `root` y su grupo. (chown, chgroup y chmod)

21. Ver el espacio total en kbs utilizados por el directorio `/root`. (du)

22. Obtener información sobre la utilización del espacio de disco/s. (df)

23. Ver por pantalla y guardar en `histo.cmd` los últimos 15 comandos ingresados por root. (tail, tee)

24. Ver el nombre de usuario mediante la variable de entorno `USERNAME`. (echo)

25. Contar las letras que componen el `PATH`. (echo y w)

26. Contar la cantidad de usuarios conectados al sistema. (who y wc)

27. Contar la cantidad de procesos del usuario `root`. (ps, cat, grep, wc)

28. Crear un alias llamado `ps_root` que devuelva el mismo resultado que el punto anterior. (alias)

29. Crear un shell script llamado memoria que muestre la cantidad de memoria libre y usada del sistema.

30. Ejecutar la utilidad `updatedb` en background con prioridad = 15. (nice)

31. ¿De que manera es posible ejecutar un proceso que continúe su ejecución aún cuando el usuario termina la sesión?.

32. ¿A qué se le denomina `demonio`?

33. ¿Qué es un proceso zombie? ¿Cómo se lo detecta?.

**Bibliografía sugerida:**

* Man, man y man.
* Texinfo documentation system.
* Resumen de comandos: [http://bit.ly/tyr-comandos](http://bit.ly/tyr-comandos)
* Semestre Perdido. Linea de Comandos: [http://bit.ly/tyr-ms-cli](http://bit.ly/tyr-ms-cli) (versión traducida por el equipo de TyR)
* Semetre Perdido. Shell: [http://bit.ly/tyr-ms-shell](http://bit.ly/tyr-ms-shell) (versión traducida por el equipo de TyR)
* Curso Básico de Linux. Víctor González Barbone.2017 <https://iie.fing.edu.uy/personal/vagonbar/sample-page/curso-basico-de-linux/>
* El manual del Administrador de Debian. Raphaël Hertzog, Roland Mas. Freexian. 2016.
  Apéndice B: "Curso breve de emergencia" <https://debian-handbook.info/browse/es-ES/stable/short-remedial-course.html>
* Libro The Linux System Admininistrator's Guide.Lars Wirzenius, Joanna Oja, Stephen Stafford, Alex Weeks <https://tldp.org/LDP/sag/html/index.html>
