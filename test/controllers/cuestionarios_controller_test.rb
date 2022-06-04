require "test_helper"

class CuestionariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cuestionario = cuestionarios(:one)
  end

  test "should get index" do
    get cuestionarios_url
    assert_response :success
  end

  test "should get new" do
    get new_cuestionario_url
    assert_response :success
  end

  test "should create cuestionario" do
    assert_difference('Cuestionario.count') do
      post cuestionarios_url, params: { cuestionario: { actividad_fisica: @cuestionario.actividad_fisica, alimentacion_dana_ambiente: @cuestionario.alimentacion_dana_ambiente, alimentacion_sana: @cuestionario.alimentacion_sana, altura: @cuestionario.altura, cantidad_bolillo: @cuestionario.cantidad_bolillo, cantidad_chocolates: @cuestionario.cantidad_chocolates, cantidad_fruta: @cuestionario.cantidad_fruta, cantidad_huevo: @cuestionario.cantidad_huevo, cantidad_pan: @cuestionario.cantidad_pan, cantidad_tortillas: @cuestionario.cantidad_tortillas, cantidad_vegetales: @cuestionario.cantidad_vegetales, ciudad: @cuestionario.ciudad, colesterol: @cuestionario.colesterol, diabetes: @cuestionario.diabetes, diabetes_familia: @cuestionario.diabetes_familia, diabetes_sintomas: @cuestionario.diabetes_sintomas, dieta: @cuestionario.dieta, edad: @cuestionario.edad, email: @cuestionario.email, escolaridad: @cuestionario.escolaridad, frecuencia_amaranto: @cuestionario.frecuencia_amaranto, frecuencia_arroz: @cuestionario.frecuencia_arroz, frecuencia_atole: @cuestionario.frecuencia_atole, frecuencia_atun: @cuestionario.frecuencia_atun, frecuencia_avena: @cuestionario.frecuencia_avena, frecuencia_bebidas_energetizantes: @cuestionario.frecuencia_bebidas_energetizantes, frecuencia_bolillo: @cuestionario.frecuencia_bolillo, frecuencia_borrego: @cuestionario.frecuencia_borrego, frecuencia_chocolates: @cuestionario.frecuencia_chocolates, frecuencia_embutidos: @cuestionario.frecuencia_embutidos, frecuencia_frituras: @cuestionario.frecuencia_frituras, frecuencia_fruta: @cuestionario.frecuencia_fruta, frecuencia_galletas: @cuestionario.frecuencia_galletas, frecuencia_huevo: @cuestionario.frecuencia_huevo, frecuencia_insectos: @cuestionario.frecuencia_insectos, frecuencia_jugos: @cuestionario.frecuencia_jugos, frecuencia_leche: @cuestionario.frecuencia_leche, frecuencia_leguminosas: @cuestionario.frecuencia_leguminosas, frecuencia_pan: @cuestionario.frecuencia_pan, frecuencia_pescados_mariscos: @cuestionario.frecuencia_pescados_mariscos, frecuencia_pollo: @cuestionario.frecuencia_pollo, frecuencia_puerco: @cuestionario.frecuencia_puerco, frecuencia_queso: @cuestionario.frecuencia_queso, frecuencia_refrescos: @cuestionario.frecuencia_refrescos, frecuencia_res: @cuestionario.frecuencia_res, frecuencia_salmon: @cuestionario.frecuencia_salmon, frecuencia_sandwich: @cuestionario.frecuencia_sandwich, frecuencia_sopas: @cuestionario.frecuencia_sopas, frecuencia_tacos: @cuestionario.frecuencia_tacos, frecuencia_tamales: @cuestionario.frecuencia_tamales, frecuencia_torta: @cuestionario.frecuencia_torta, frecuencia_tortillas: @cuestionario.frecuencia_tortillas, frecuencia_vegetales: @cuestionario.frecuencia_vegetales, frecuencia_yogurt: @cuestionario.frecuencia_yogurt, glucosa: @cuestionario.glucosa, hipertension: @cuestionario.hipertension, insectos: @cuestionario.insectos, localidad: @cuestionario.localidad, nombre: @cuestionario.nombre, obesidad: @cuestionario.obesidad, origen_carne: @cuestionario.origen_carne, origen_cereales: @cuestionario.origen_cereales, origen_frutas: @cuestionario.origen_frutas, origen_leche: @cuestionario.origen_leche, origen_vegetales: @cuestionario.origen_vegetales, pais: @cuestionario.pais, persona_actividad: @cuestionario.persona_actividad, peso: @cuestionario.peso, sexo: @cuestionario.sexo, sobrepeso: @cuestionario.sobrepeso, trigliceridos: @cuestionario.trigliceridos, valores_embutidos: @cuestionario.valores_embutidos, valores_frituras: @cuestionario.valores_frituras, valores_galletas: @cuestionario.valores_galletas, valores_pan: @cuestionario.valores_pan, valores_pescados_mariscos: @cuestionario.valores_pescados_mariscos, valores_tacos: @cuestionario.valores_tacos } }
    end

    assert_redirected_to cuestionario_url(Cuestionario.last)
  end

  test "should show cuestionario" do
    get cuestionario_url(@cuestionario)
    assert_response :success
  end

  test "should get edit" do
    get edit_cuestionario_url(@cuestionario)
    assert_response :success
  end

  test "should update cuestionario" do
    patch cuestionario_url(@cuestionario), params: { cuestionario: { actividad_fisica: @cuestionario.actividad_fisica, alimentacion_dana_ambiente: @cuestionario.alimentacion_dana_ambiente, alimentacion_sana: @cuestionario.alimentacion_sana, altura: @cuestionario.altura, cantidad_bolillo: @cuestionario.cantidad_bolillo, cantidad_chocolates: @cuestionario.cantidad_chocolates, cantidad_fruta: @cuestionario.cantidad_fruta, cantidad_huevo: @cuestionario.cantidad_huevo, cantidad_pan: @cuestionario.cantidad_pan, cantidad_tortillas: @cuestionario.cantidad_tortillas, cantidad_vegetales: @cuestionario.cantidad_vegetales, ciudad: @cuestionario.ciudad, colesterol: @cuestionario.colesterol, diabetes: @cuestionario.diabetes, diabetes_familia: @cuestionario.diabetes_familia, diabetes_sintomas: @cuestionario.diabetes_sintomas, dieta: @cuestionario.dieta, edad: @cuestionario.edad, email: @cuestionario.email, escolaridad: @cuestionario.escolaridad, frecuencia_amaranto: @cuestionario.frecuencia_amaranto, frecuencia_arroz: @cuestionario.frecuencia_arroz, frecuencia_atole: @cuestionario.frecuencia_atole, frecuencia_atun: @cuestionario.frecuencia_atun, frecuencia_avena: @cuestionario.frecuencia_avena, frecuencia_bebidas_energetizantes: @cuestionario.frecuencia_bebidas_energetizantes, frecuencia_bolillo: @cuestionario.frecuencia_bolillo, frecuencia_borrego: @cuestionario.frecuencia_borrego, frecuencia_chocolates: @cuestionario.frecuencia_chocolates, frecuencia_embutidos: @cuestionario.frecuencia_embutidos, frecuencia_frituras: @cuestionario.frecuencia_frituras, frecuencia_fruta: @cuestionario.frecuencia_fruta, frecuencia_galletas: @cuestionario.frecuencia_galletas, frecuencia_huevo: @cuestionario.frecuencia_huevo, frecuencia_insectos: @cuestionario.frecuencia_insectos, frecuencia_jugos: @cuestionario.frecuencia_jugos, frecuencia_leche: @cuestionario.frecuencia_leche, frecuencia_leguminosas: @cuestionario.frecuencia_leguminosas, frecuencia_pan: @cuestionario.frecuencia_pan, frecuencia_pescados_mariscos: @cuestionario.frecuencia_pescados_mariscos, frecuencia_pollo: @cuestionario.frecuencia_pollo, frecuencia_puerco: @cuestionario.frecuencia_puerco, frecuencia_queso: @cuestionario.frecuencia_queso, frecuencia_refrescos: @cuestionario.frecuencia_refrescos, frecuencia_res: @cuestionario.frecuencia_res, frecuencia_salmon: @cuestionario.frecuencia_salmon, frecuencia_sandwich: @cuestionario.frecuencia_sandwich, frecuencia_sopas: @cuestionario.frecuencia_sopas, frecuencia_tacos: @cuestionario.frecuencia_tacos, frecuencia_tamales: @cuestionario.frecuencia_tamales, frecuencia_torta: @cuestionario.frecuencia_torta, frecuencia_tortillas: @cuestionario.frecuencia_tortillas, frecuencia_vegetales: @cuestionario.frecuencia_vegetales, frecuencia_yogurt: @cuestionario.frecuencia_yogurt, glucosa: @cuestionario.glucosa, hipertension: @cuestionario.hipertension, insectos: @cuestionario.insectos, localidad: @cuestionario.localidad, nombre: @cuestionario.nombre, obesidad: @cuestionario.obesidad, origen_carne: @cuestionario.origen_carne, origen_cereales: @cuestionario.origen_cereales, origen_frutas: @cuestionario.origen_frutas, origen_leche: @cuestionario.origen_leche, origen_vegetales: @cuestionario.origen_vegetales, pais: @cuestionario.pais, persona_actividad: @cuestionario.persona_actividad, peso: @cuestionario.peso, sexo: @cuestionario.sexo, sobrepeso: @cuestionario.sobrepeso, trigliceridos: @cuestionario.trigliceridos, valores_embutidos: @cuestionario.valores_embutidos, valores_frituras: @cuestionario.valores_frituras, valores_galletas: @cuestionario.valores_galletas, valores_pan: @cuestionario.valores_pan, valores_pescados_mariscos: @cuestionario.valores_pescados_mariscos, valores_tacos: @cuestionario.valores_tacos } }
    assert_redirected_to cuestionario_url(@cuestionario)
  end

  test "should destroy cuestionario" do
    assert_difference('Cuestionario.count', -1) do
      delete cuestionario_url(@cuestionario)
    end

    assert_redirected_to cuestionarios_url
  end
end
