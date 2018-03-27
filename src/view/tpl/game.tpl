<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="application/xml;charset=utf-8" />
        <title>SuPyGirls</title>
        <link rel="shortcut icon" href="image/favicon.ico" type="image/x-icon"/>
        % for css in brython_css:
        <link rel="stylesheet" href="{{ css }}" type="text/css" />
        % end
        % for scp in brython_js:
        <script type="text/javascript" src="{{ scp  }}"></script>
        % end

        <script type="text/python">
            import {{ path }}
        </script>

        <!--
        #! /usr/bin/env python
        # -*- coding: UTF8 -*-
        # Este arquivo é parte do programa Kwarwp
        # Copyright 2010-2018 Carlo Oliveira <carlo@nce.ufrj.br>,
        # `Labase <http://labase.selfip.org/>`__; `GPL <http://j.mp/GNU_GPL3>`__.
        #
        # Kwarwp é um software livre; você pode redistribuí-lo e/ou
        # modificá-lo dentro dos termos da Licença Pública Geral GNU como
        # publicada pela Fundação do Software Livre (FSF); na versão 2 da
        # Licença.
        #
        # Este programa é distribuído na esperança de que possa ser útil,
        # mas SEM NENHUMA GARANTIA; sem uma garantia implícita de ADEQUAÇÃO
        # a qualquer MERCADO ou APLICAÇÃO EM PARTICULAR. Veja a
        # Licença Pública Geral GNU para maiores detalhes.
        #
        # Você deve ter recebido uma cópia da Licença Pública Geral GNU
        # junto com este programa, se não, veja em <http://www.gnu.org/licenses/>

        """Brython front end client.

        .. moduleauthor:: Carlo Oliveira <carlo@nce.ufrj.br>

        """

        -->
        <script type="text/python">
            from browser import *
            from browser.local_storage import storage
            from _core.main import Game
            import abacaxi
            class MockBrython:
                document = document
                html = html
                alert = alert
                storage = storage
            main = Game(br=MockBrython)
            main.paint_scenes()
       </script>
    </head>
    <body onLoad="brython({debug:1, cache:'browser', static_stdlib_import:true, pythonpath :['_spy','_vit/{{mod}}']})">
        <div id="pydiv"  title="" style="width: 99%;
            height: 99%;
            position: absolute;
            top:0;
            bottom: 0;
            left: 0;
            right: 0;
            margin: auto;
            background-color: forestgreen;
        ">
            <div style="position: absolute; top=0; left=0;">
                <img src="image/sky.gif"/>
            </div>
            <div id='the_sun' style="position: absolute; top=0; left=0;
             animation-name: daylight; animation-duration: 300s">
                <img src="image/sun.gif"/>
            </div>
        </div>
    </body>

</html>