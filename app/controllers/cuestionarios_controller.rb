class CuestionariosController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create show index]
  before_action :set_cuestionario, only: %i[show edit update destroy]

  # GET /cuestionarios
  def index
    @cuestionarios = Cuestionario.all
  end

  # GET /cuestionarios/1
  def show
    hs1
    hs2
    kcal_calculator
    huella_carbono
  end

  # GET /cuestionarios/new
  def new
    @cuestionario = Cuestionario.new
  end

  def edit
  end

  def create
    @cuestionario = Cuestionario.new(cuestionario_params)

    if @cuestionario.save
      redirect_to @cuestionario, notice: 'Cuestionario was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /cuestionarios/1
  def update
    if @cuestionario.update(cuestionario_params)
      redirect_to @cuestionario, notice: 'Cuestionario was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @cuestionario.destroy
    redirect_to cuestionarios_url, notice: 'Cuestionario was successfully destroyed.'
  end

  private

  def set_cuestionario
    @cuestionario = Cuestionario.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cuestionario_params
    params.require(:cuestionario).permit(:email, :nombre, :edad, :sexo, :escolaridad, :pais, :ciudad, :localidad, :peso, :altura, :alimentacion_sana, :alimentacion_dana_ambiente, :persona_actividad, :actividad_fisica, :sobrepeso, :obesidad, :hipertension, :colesterol, :trigliceridos, :diabetes, :glucosa, :diabetes_familia, :dieta, :origen_vegetales, :origen_frutas, :origen_carne, :origen_leche, :origen_cereales, :frecuencia_res, :frecuencia_puerco, :frecuencia_borrego, :frecuencia_pollo, :frecuencia_salmon, :frecuencia_atun, :frecuencia_leche, :frecuencia_queso, :frecuencia_yogurt, :frecuencia_pescados_mariscos, :valores_pescados_mariscos, :frecuencia_huevo, :cantidad_huevo, :frecuencia_vegetales, :cantidad_vegetales, :frecuencia_fruta, :cantidad_fruta, :frecuencia_arroz, :frecuencia_leguminosas, :frecuencia_avena, :frecuencia_amaranto, :frecuencia_tortillas, :cantidad_tortillas, :insectos, :frecuencia_insectos, :frecuencia_tamales, :frecuencia_atole, :frecuencia_sandwich, :frecuencia_tacos, :frecuencia_torta, :frecuencia_bolillo, :cantidad_bolillo, :frecuencia_sopas, :frecuencia_jugos, :frecuencia_refrescos, :frecuencia_bebidas_energetizantes, :frecuencia_galletas, :frecuencia_embutidos, :frecuencia_pan, :cantidad_pan, :frecuencia_frituras, :frecuencia_chocolates, :cantidad_chocolates, :al_pastor, :necesidad_orinar, :perdida_peso, :sed_excesiva, :hambre_excesiva, :suadero, :guisados, :galletas_saladas, :galletas_dulces, :jamon_pavo, :jamon_puerco, :salchicha_pavo, :fritura_papa, :fritura_chicharron, :mantecadas, :pan_blanco)
  end

  # THIS SECTION CONTAINS ALL THE FORMULAS AND LOGIC FOR HUELLA DE SALUD

  def harris_benedict(weight)
    # Mujeres: TMB = 655 + (9,6 x peso en kg) + (1.8 x altura en cm) - (4,7 x edad en años).
    # Hombres: Tasa Metabólica basal = 66 + (13,7 x peso en kg) + (5 x altura en cm) - (6,75 x edad en años).
    gender = @cuestionario.sexo
    height = (@cuestionario.altura * 100).to_i
    age = @cuestionario.edad
    total = nil
    if gender.eql?('femenino')
      total = (655 + (9.6 * weight) + (1.8 * height) - (4.7 * age)).to_i
    else
      total = 66 + ((13.7 * weight) + (5 * height) - (6.75 * age)).to_i
    end
    total
  end

  def faf
    physical_activity = ['Sedentaria', 'Fisicamente activa', 'Deportista']
    activity_intensity = physical_activity.find_index(@cuestionario.persona_actividad)
    pa_frequency = @cuestionario.actividad_fisica
    faf_arr = [[0,	0.5,	0.7,	0.9,	1.1],
               [0,	1.2,	1.3,	1.4,	1.5],
               [0,	1.6,	1.63,	1.65,	1.7]]
    @factor_actividad_fisica = faf_arr[activity_intensity][pa_frequency]
  end

  def eta(harris_benedict)
    (harris_benedict * 0.1).floor
  end

  def hs(harris_benedict, eta)
    # HS= HB (Harris Benedict) x 0.9 x FA (Factor de actividad física)+ ETA (Efecto termogénico de los alimentos)
    # HS= HB: 1324 x 0.9 x 1.1 + 10% de HB.
    # ETA= 132
    # HS= 1,310 + 132= 1,442 kcal
    ((harris_benedict * 0.9 * @factor_actividad_fisica) + eta).floor
  end

  def lorentz
    # Fórmula de Lorentz: Depende de si es hombre o mujer.
    # Peso ideal mujer = (altura cm – 100) – ([altura cm – 150) / 2.5].
    # Peso ideal hombre = (altura cm – 100) – [( altura cm – 150) / 4].
    gender = @cuestionario.sexo
    height = (@cuestionario.altura * 100).to_i
    @lorentz = nil

    if gender.eql?('femenino')
      @lorentz = (height - 100) - ((height - 150) / 2.5).to_i
    else
      @lorentz = (height - 100) - ((height - 150) / 4).to_i
    end
  end

  def peso_ajustado
    # Después de aplicar Lorentz el resultado obtenido se sustituye en esta fórmula: Peso ajustado:
    # PA (kg)= P ideal + 0.25 (peso actual – peso ideal)
    @peso_ajustado = @lorentz + (0.25 * (@cuestionario.peso - @lorentz)).floor
  end

  def hs1
    @harris_benedict = harris_benedict(@cuestionario.peso)
    faf
    @eta1 = eta(@harris_benedict)
    @hs1 = hs(@harris_benedict, @eta1)
  end

  def hs2
    lorentz
    peso_ajustado
    @harris_benedict_ajustado = harris_benedict(peso_ajustado)
    @eta2 = eta(@harris_benedict_ajustado)
    @hs2 = hs(@harris_benedict_ajustado, @eta2)
  end

  # THIS SECTION CONTAINS LOGIC AND FORMULAS FOR CALORIES CALCULATOR

  def obtener_calorias(kcal_porcion, frecuencia_consumo)
    (kcal_porcion * frecuencia_consumo / 7).round(2)
  end

  def obtener_calorias_pescados_y_mariscos(grupo, frecuencia_consumo)
    calorias_segun_grupo = [226, 195, 194]
    kcal_porcion = calorias_segun_grupo[grupo.to_i]
    (kcal_porcion * frecuencia_consumo / 7).round(2)
  end

  def obtener_calorias_multiplicador(kcal_unidad, frecuencia_consumo, cantidad = 1)
    (kcal_unidad * frecuencia_consumo / 7 * cantidad).round(2)
  end

  def obtener_carbono(origen, arr_valores_kg_co2, porciones_por_kilo, frecuencia_consumo)
    origen_alimento = ['no consumo', 'organico', 'intensivo'].index(origen)
    kg_co2 = arr_valores_kg_co2[origen_alimento]
    (kg_co2 / porciones_por_kilo * frecuencia_consumo / 7).round(2)
  end

  def obtener_carbono_pescados_y_mariscos(origen, grupo, frecuencia_consumo)
    origen_alimento = ['no consumo', 'organico', 'intensivo'].index(origen)
    valores_grupos_carbono = [[2.95, 3.71, 3.71],
                              [9.42, 10.13, 10.13],
                              [0.73, 1.44, 1.44]]
    valores_grupos_porciones = [5, 6.25, 5]
    arr_valores_kg_co2 = valores_grupos_carbono[grupo.to_i]
    porciones_por_kilo = valores_grupos_porciones[grupo.to_i]
    kg_co2 = arr_valores_kg_co2[origen_alimento]
    (kg_co2 / porciones_por_kilo * frecuencia_consumo / 7).round(2)
  end

  def obtener_carbono_multiplicador(origen, arr_valores_kg_co2, porciones_por_kilo, frecuencia_consumo, cantidad)
    origen_alimento = ['no consumo', 'organico', 'intensivo'].index(origen)
    kg_co2 = arr_valores_kg_co2[origen_alimento]
    (kg_co2 / porciones_por_kilo * frecuencia_consumo / 7 * cantidad).round(2)
  end

  def contador_calorias_simple
    calorias_res = obtener_calorias(CALORIAS_POR_PORCION[:res], @cuestionario.frecuencia_res)
    calorias_cerdo = obtener_calorias(CALORIAS_POR_PORCION[:cerdo], @cuestionario.frecuencia_puerco)
    calorias_borrego = obtener_calorias(CALORIAS_POR_PORCION[:borrego], @cuestionario.frecuencia_borrego)
    calorias_pollo = obtener_calorias(CALORIAS_POR_PORCION[:pollo], @cuestionario.frecuencia_pollo)
    calorias_leche = obtener_calorias(CALORIAS_POR_PORCION[:leche], @cuestionario.frecuencia_leche)
    calorias_queso = obtener_calorias(CALORIAS_POR_PORCION[:queso], @cuestionario.frecuencia_queso)
    calorias_yogurt = obtener_calorias(CALORIAS_POR_PORCION[:yogurt], @cuestionario.frecuencia_yogurt)
    calorias_arroz = obtener_calorias(CALORIAS_POR_PORCION[:arroz], @cuestionario.frecuencia_arroz)
    calorias_leguminosas = obtener_calorias(CALORIAS_POR_PORCION[:leguminosas], @cuestionario.frecuencia_leguminosas)
    calorias_avena = obtener_calorias(CALORIAS_POR_PORCION[:avena], @cuestionario.frecuencia_avena)
    calorias_amaranto = obtener_calorias(CALORIAS_POR_PORCION[:amaranto], @cuestionario.frecuencia_amaranto)
    [calorias_res, calorias_cerdo, calorias_borrego, calorias_pollo, calorias_leche, calorias_queso, calorias_yogurt, calorias_arroz, calorias_leguminosas, calorias_avena, calorias_amaranto].sum
  end

  def contador_calorias_compuesto
    calorias_huevo = obtener_calorias_multiplicador(CALORIAS_POR_PORCION[:huevo], @cuestionario.frecuencia_huevo, @cuestionario.cantidad_huevo)
    calorias_vegetales = obtener_calorias_multiplicador(CALORIAS_POR_PORCION[:vegetales], @cuestionario.frecuencia_vegetales, @cuestionario.cantidad_vegetales)
    calorias_fruta = obtener_calorias_multiplicador(CALORIAS_POR_PORCION[:fruta], @cuestionario.frecuencia_fruta, @cuestionario.cantidad_fruta)
    calorias_tortillas = obtener_calorias_multiplicador(CALORIAS_POR_PORCION[:tortillas], @cuestionario.frecuencia_tortillas, @cuestionario.cantidad_tortillas)
    [calorias_huevo, calorias_vegetales, calorias_fruta, calorias_tortillas].sum
  end

  def contador_calorias_especial
    obtener_calorias_pescados_y_mariscos(@cuestionario.valores_pescados_mariscos, @cuestionario.frecuencia_pescados_mariscos)
  end

  def kcal_calculator
    @calorias = [contador_calorias_simple, contador_calorias_compuesto, contador_calorias_especial].sum
  end

  def contador_carbono_simple
    carbono_res = obtener_carbono(@cuestionario.origen_carne, VALORES_KG_CO2[:res], PORCIONES_KG[:res], @cuestionario.frecuencia_res)
    carbono_puerco = obtener_carbono(@cuestionario.origen_carne, VALORES_KG_CO2[:puerco], PORCIONES_KG[:puerco], @cuestionario.frecuencia_puerco)
    carbono_borrego = obtener_carbono(@cuestionario.origen_carne, VALORES_KG_CO2[:borrego], PORCIONES_KG[:borrego], @cuestionario.frecuencia_borrego)
    carbono_pollo = obtener_carbono(@cuestionario.origen_carne, VALORES_KG_CO2[:pollo], PORCIONES_KG[:pollo], @cuestionario.frecuencia_pollo)
    carbono_leche = obtener_carbono(@cuestionario.origen_leche, VALORES_KG_CO2[:leche], PORCIONES_KG[:leche], @cuestionario.frecuencia_leche)
    carbono_queso = obtener_carbono(@cuestionario.origen_leche, VALORES_KG_CO2[:queso], PORCIONES_KG[:queso], @cuestionario.frecuencia_queso)
    carbono_yogurt = obtener_carbono(@cuestionario.origen_leche, VALORES_KG_CO2[:yogurt], PORCIONES_KG[:yogurt], @cuestionario.frecuencia_yogurt)
    carbono_arroz = obtener_carbono(@cuestionario.origen_cereales, VALORES_KG_CO2[:arroz], PORCIONES_KG[:arroz], @cuestionario.frecuencia_arroz)
    carbono_leguminosas = obtener_carbono(@cuestionario.origen_cereales, VALORES_KG_CO2[:leguminosas], PORCIONES_KG[:leguminosas], @cuestionario.frecuencia_leguminosas)
    carbono_avena = obtener_carbono(@cuestionario.origen_cereales, VALORES_KG_CO2[:avena], PORCIONES_KG[:avena], @cuestionario.frecuencia_avena)
    carbono_amaranto = obtener_carbono(@cuestionario.origen_cereales, VALORES_KG_CO2[:amaranto], PORCIONES_KG[:amaranto], @cuestionario.frecuencia_amaranto)
    [carbono_res, carbono_puerco, carbono_borrego, carbono_pollo, carbono_leche, carbono_queso, carbono_yogurt, carbono_arroz, carbono_leguminosas, carbono_avena, carbono_amaranto].sum
  end

  def contador_carbono_compuesto
    carbono_huevo = obtener_carbono_multiplicador(@cuestionario.origen_carne, VALORES_KG_CO2[:huevo], PORCIONES_KG[:huevo], @cuestionario.frecuencia_huevo, @cuestionario.cantidad_huevo)
    carbono_vegetales = obtener_carbono_multiplicador(@cuestionario.origen_vegetales, VALORES_KG_CO2[:vegetales], PORCIONES_KG[:vegetales], @cuestionario.frecuencia_vegetales, @cuestionario.cantidad_vegetales)
    carbono_fruta = obtener_carbono_multiplicador(@cuestionario.origen_frutas, VALORES_KG_CO2[:fruta], PORCIONES_KG[:fruta], @cuestionario.frecuencia_fruta, @cuestionario.cantidad_fruta)
    carbono_tortillas = obtener_carbono_multiplicador(@cuestionario.origen_cereales, VALORES_KG_CO2[:tortillas], PORCIONES_KG[:tortillas], @cuestionario.frecuencia_tortillas, @cuestionario.cantidad_tortillas)
    [carbono_huevo, carbono_vegetales, carbono_fruta, carbono_tortillas].sum
  end

  def contador_carbono_especial
    obtener_carbono_pescados_y_mariscos(@cuestionario.origen_carne, @cuestionario.valores_pescados_mariscos, @cuestionario.frecuencia_pescados_mariscos)
  end

  def huella_carbono
    @carbono = [contador_carbono_simple, contador_carbono_compuesto, contador_carbono_especial].sum
  end

  CALORIAS_POR_PORCION = {
    res: 135,
    cerdo: 297,
    borrego: 177,
    pollo: 195,
    leche: 152,
    queso: 100,
    yogurt: 91,
    huevo: 74,
    vegetales: 31,
    fruta: 94,
    arroz: 103,
    leguminosas: 74,
    avena: 117,
    amaranto: 187,
    tortillas: 52
  }

  PORCIONES_KG = {
    res: 10,
    puerco: 10,
    borrego: 10,
    pollo: 10,
    leche: 4,
    queso: 33.33,
    yogurt: 8,
    huevo: 20,
    vegetales: 11.11,
    fruta: 5.95,
    arroz: 12.5,
    leguminosas: 20,
    avena: 33.33,
    amaranto: 20,
    tortillas: 1
  }

  VALORES_KG_CO2 = {
    res: [16.33,	16.33, 26.99],
    puerco: [4.5, 4.5, 6.17],
    borrego: [24.34, 24.34, 25.09],
    pollo: [3.1, 3.1, 3.65],
    leche: [1.14, 1.14, 1.32],
    queso: [9.31, 10.61, 10.61],
    yogurt: [0.79, 0.9, 0.9],
    huevo: [1.97, 1.97, 3.49],
    vegetales: [0.3, 0.3, 0.31],
    fruta: [0.21, 0.21, 0.35],
    arroz: [2.5, 2.5, 2.45],
    leguminosas: [0.54, 0.54, 0.3],
    avena: [0.58, 0.58, 0.85],
    amaranto: [0.4, 0.4, 0.58],
    tortillas: [0.14, 0.14, 0.43]
  }

  # no hay valores para salmon, atun, que estan en el cuestionario
  # en el cuestionario no hay preguntas de pavo pero si estan los valores
  # no hay pregunta del origen del queso ni del yogurt, calculado con el origen de la leche
  # no hay pregunta del origen del pescado, calculado con el origen de la carne
  # no hay pregunta del origen del huevo, calculado con el origen de la carne
  # es correcto el valor de una tortilla? 1 tortilla == 1 gr? 1kg tortilla == huella de co2 en tabla?
  # en arroz es intensivo menor que organico?
  # en leguminosas es intensivo menor que organico?
end
