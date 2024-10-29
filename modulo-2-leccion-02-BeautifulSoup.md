**Pair programming Beautiful Soup**


Enunciado: Escribe una función llamada `scrape_coches_ocasion` que acepta una URL como argumento y devuelve un DataFrame de pandas con información sobre coches de ocasión encontrados en la página web especificada. La función realizará las siguientes tareas:

1. Realizará una solicitud HTTP GET a la [siguiente](https://www.ocasionplus.com/coches-ocasion?type%3DCAR%26sort%3DFECHAOP_DESC%26page%3D2) url.

2. Comprobará el código de estado de la respuesta. Si el código no es 200 (OK), imprimirá un mensaje de error y retornará `None`.

3. Extraerá los nombres de los coches, los precios rebajados, los precios originales y la información de los kilómetros recorridos de la página.

4. Organizará los datos extraídos en un DataFrame de pandas con las siguientes columnas:

   - "coche": Nombres de los coches.

   - "precio_rebajado": Precios rebajados.

   - "precio_original": Precios originales.

   - "km": Kilómetros recorridos.

6. Retornará el DataFrame resultante.

7. Una vez extraida toda la información deberéis almacenar toda la información en un DataFrame. El *DataFrame* debe tener un aspecto parecido a este: 


    | Coche                                               | Precio Rebajado | Precio Original | Kilómetros |
    |----------------------------------------------------|-----------------|-----------------|------------|
    | Toyota Corolla 140H Active Plus Auto (140 CV)      | 25.273€         | 27.800€         | 2.839 km   |
    | Ford Focus 1.0 Ecoboost S&S Titanium Auto (125... | 17.354€         | 19.090€         | 37.479 km  |
    | Hyundai Santa Fe 2.0 CRDI Essence 4x2 7 Plazas... | 21.363€         | 23.500€         | 51.690 km  |
    | Audi A3 Sportback Sportback 1.6 TDI (116 CV)      | 17.727€         | 19.500€         | 66.918 km  |
    | Hyundai Tucson 1.6 TGDI (177CV) Tecno Sky Safe... | 23.954€         | 26.350€         | 32.183 km  |
    | Jeep Renegade 1.0G 80 Aniversario 4x2 (120 CV)    | 18.636€         | 20.500€         | 60.279 km  |
    | Renault Captur Zen Energy TCe (120 CV)            | 14.727€         | 16.200€         | 25.316 km  |
    | Audi A1 Sportback 25 TFSI (95 CV)                 | 14.363€         | 15.800€         | 65.520 km  |
    | Citroen C4 Cactus PureTech 110 S&S Shine Pack ... | 15.082€         | 16.590€         | 35.116 km  |
    | Kia Sportage GDi Drive 4x2 (132 CV)               | 17.682€         | 20.250€         | 82.460 km  |
    | Dacia Sandero Serie Limitada Xplore TCe (90 CV)  | 12.718€         | 13.990€         | 82.414 km  |
    | SEAT Ateca 1.4 EcoTSI S&S Xcellence (150 CV)      | 21.363€         | 23.500€         | 40.859 km  |
    | Peugeot 208 PEUGEOT 208 PureTech 73kW (100CV) GT | 17.818€         | 19.600€         | 22.180 km  |
    | Mercedes-Benz Clase CLA CLA 200 (163 CV) PACK AMG | 30.681€         | 33.750€         | 61.658 km  |
    | Peugeot 208 PureTech 100 GT (100 CV)             | 17.772€         | 19.550€         | 23.631 km  |
    | Opel Astra 1.5 D GS Line (122 CV)                | 14.045€         | 15.450€         | 71.934 km  |
    | SEAT Leon 2.0 TDI S&S Style (115 CV)             | 20.081€         | 22.090€         | 29.035 km  |
    | Peugeot 208 PureTech 100 GT (100 CV)             | 17.681€         | 19.450€         | 30.896 km  |
    | Opel Mokka X OPEL Mokka X 1.4 T 103kW 4X2 Inno... | 14.727€         | 16.200€         | 114.422 km |
    | Citroen Berlingo Talla M PureTech 110 S&S SHINE   | 20.818€         | 22.900€         | 49.615 km  |

