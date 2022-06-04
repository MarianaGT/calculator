require "application_system_test_case"

class CuestionariosTest < ApplicationSystemTestCase
  setup do
    @cuestionario = cuestionarios(:one)
  end

  test "visiting the index" do
    visit cuestionarios_url
    assert_selector "h1", text: "Cuestionarios"
  end

  test "creating a Cuestionario" do
    visit cuestionarios_url
    click_on "New Cuestionario"

    fill_in "Actividad fisica", with: @cuestionario.actividad_fisica
    fill_in "Alimentacion dana ambiente", with: @cuestionario.alimentacion_dana_ambiente
    fill_in "Alimentacion sana", with: @cuestionario.alimentacion_sana
    fill_in "Altura", with: @cuestionario.altura
    fill_in "Cantidad bolillo", with: @cuestionario.cantidad_bolillo
    fill_in "Cantidad chocolates", with: @cuestionario.cantidad_chocolates
    fill_in "Cantidad fruta", with: @cuestionario.cantidad_fruta
    fill_in "Cantidad huevo", with: @cuestionario.cantidad_huevo
    fill_in "Cantidad pan", with: @cuestionario.cantidad_pan
    fill_in "Cantidad tortillas", with: @cuestionario.cantidad_tortillas
    fill_in "Cantidad vegetales", with: @cuestionario.cantidad_vegetales
    fill_in "Ciudad", with: @cuestionario.ciudad
    fill_in "Colesterol", with: @cuestionario.colesterol
    fill_in "Diabetes", with: @cuestionario.diabetes
    fill_in "Diabetes familia", with: @cuestionario.diabetes_familia
    fill_in "Diabetes sintomas", with: @cuestionario.diabetes_sintomas
    fill_in "Dieta", with: @cuestionario.dieta
    fill_in "Edad", with: @cuestionario.edad
    fill_in "Email", with: @cuestionario.email
    fill_in "Escolaridad", with: @cuestionario.escolaridad
    fill_in "Frecuencia amaranto", with: @cuestionario.frecuencia_amaranto
    fill_in "Frecuencia arroz", with: @cuestionario.frecuencia_arroz
    fill_in "Frecuencia atole", with: @cuestionario.frecuencia_atole
    fill_in "Frecuencia atun", with: @cuestionario.frecuencia_atun
    fill_in "Frecuencia avena", with: @cuestionario.frecuencia_avena
    fill_in "Frecuencia bebidas energetizantes", with: @cuestionario.frecuencia_bebidas_energetizantes
    fill_in "Frecuencia bolillo", with: @cuestionario.frecuencia_bolillo
    fill_in "Frecuencia borrego", with: @cuestionario.frecuencia_borrego
    fill_in "Frecuencia chocolates", with: @cuestionario.frecuencia_chocolates
    fill_in "Frecuencia embutidos", with: @cuestionario.frecuencia_embutidos
    fill_in "Frecuencia frituras", with: @cuestionario.frecuencia_frituras
    fill_in "Frecuencia fruta", with: @cuestionario.frecuencia_fruta
    fill_in "Frecuencia galletas", with: @cuestionario.frecuencia_galletas
    fill_in "Frecuencia huevo", with: @cuestionario.frecuencia_huevo
    fill_in "Frecuencia insectos", with: @cuestionario.frecuencia_insectos
    fill_in "Frecuencia jugos", with: @cuestionario.frecuencia_jugos
    fill_in "Frecuencia leche", with: @cuestionario.frecuencia_leche
    fill_in "Frecuencia leguminosas", with: @cuestionario.frecuencia_leguminosas
    fill_in "Frecuencia pan", with: @cuestionario.frecuencia_pan
    fill_in "Frecuencia pescados mariscos", with: @cuestionario.frecuencia_pescados_mariscos
    fill_in "Frecuencia pollo", with: @cuestionario.frecuencia_pollo
    fill_in "Frecuencia puerco", with: @cuestionario.frecuencia_puerco
    fill_in "Frecuencia queso", with: @cuestionario.frecuencia_queso
    fill_in "Frecuencia refrescos", with: @cuestionario.frecuencia_refrescos
    fill_in "Frecuencia res", with: @cuestionario.frecuencia_res
    fill_in "Frecuencia salmon", with: @cuestionario.frecuencia_salmon
    fill_in "Frecuencia sandwich", with: @cuestionario.frecuencia_sandwich
    fill_in "Frecuencia sopas", with: @cuestionario.frecuencia_sopas
    fill_in "Frecuencia tacos", with: @cuestionario.frecuencia_tacos
    fill_in "Frecuencia tamales", with: @cuestionario.frecuencia_tamales
    fill_in "Frecuencia torta", with: @cuestionario.frecuencia_torta
    fill_in "Frecuencia tortillas", with: @cuestionario.frecuencia_tortillas
    fill_in "Frecuencia vegetales", with: @cuestionario.frecuencia_vegetales
    fill_in "Frecuencia yogurt", with: @cuestionario.frecuencia_yogurt
    fill_in "Glucosa", with: @cuestionario.glucosa
    fill_in "Hipertension", with: @cuestionario.hipertension
    fill_in "Insectos", with: @cuestionario.insectos
    fill_in "Localidad", with: @cuestionario.localidad
    fill_in "Nombre", with: @cuestionario.nombre
    fill_in "Obesidad", with: @cuestionario.obesidad
    fill_in "Origen carne", with: @cuestionario.origen_carne
    fill_in "Origen cereales", with: @cuestionario.origen_cereales
    fill_in "Origen frutas", with: @cuestionario.origen_frutas
    fill_in "Origen leche", with: @cuestionario.origen_leche
    fill_in "Origen vegetales", with: @cuestionario.origen_vegetales
    fill_in "Pais", with: @cuestionario.pais
    fill_in "Persona actividad", with: @cuestionario.persona_actividad
    fill_in "Peso", with: @cuestionario.peso
    fill_in "Sexo", with: @cuestionario.sexo
    fill_in "Sobrepeso", with: @cuestionario.sobrepeso
    fill_in "Trigliceridos", with: @cuestionario.trigliceridos
    fill_in "Valores embutidos", with: @cuestionario.valores_embutidos
    fill_in "Valores frituras", with: @cuestionario.valores_frituras
    fill_in "Valores galletas", with: @cuestionario.valores_galletas
    fill_in "Valores pan", with: @cuestionario.valores_pan
    fill_in "Valores pescados mariscos", with: @cuestionario.valores_pescados_mariscos
    fill_in "Valores tacos", with: @cuestionario.valores_tacos
    click_on "Create Cuestionario"

    assert_text "Cuestionario was successfully created"
    click_on "Back"
  end

  test "updating a Cuestionario" do
    visit cuestionarios_url
    click_on "Edit", match: :first

    fill_in "Actividad fisica", with: @cuestionario.actividad_fisica
    fill_in "Alimentacion dana ambiente", with: @cuestionario.alimentacion_dana_ambiente
    fill_in "Alimentacion sana", with: @cuestionario.alimentacion_sana
    fill_in "Altura", with: @cuestionario.altura
    fill_in "Cantidad bolillo", with: @cuestionario.cantidad_bolillo
    fill_in "Cantidad chocolates", with: @cuestionario.cantidad_chocolates
    fill_in "Cantidad fruta", with: @cuestionario.cantidad_fruta
    fill_in "Cantidad huevo", with: @cuestionario.cantidad_huevo
    fill_in "Cantidad pan", with: @cuestionario.cantidad_pan
    fill_in "Cantidad tortillas", with: @cuestionario.cantidad_tortillas
    fill_in "Cantidad vegetales", with: @cuestionario.cantidad_vegetales
    fill_in "Ciudad", with: @cuestionario.ciudad
    fill_in "Colesterol", with: @cuestionario.colesterol
    fill_in "Diabetes", with: @cuestionario.diabetes
    fill_in "Diabetes familia", with: @cuestionario.diabetes_familia
    fill_in "Diabetes sintomas", with: @cuestionario.diabetes_sintomas
    fill_in "Dieta", with: @cuestionario.dieta
    fill_in "Edad", with: @cuestionario.edad
    fill_in "Email", with: @cuestionario.email
    fill_in "Escolaridad", with: @cuestionario.escolaridad
    fill_in "Frecuencia amaranto", with: @cuestionario.frecuencia_amaranto
    fill_in "Frecuencia arroz", with: @cuestionario.frecuencia_arroz
    fill_in "Frecuencia atole", with: @cuestionario.frecuencia_atole
    fill_in "Frecuencia atun", with: @cuestionario.frecuencia_atun
    fill_in "Frecuencia avena", with: @cuestionario.frecuencia_avena
    fill_in "Frecuencia bebidas energetizantes", with: @cuestionario.frecuencia_bebidas_energetizantes
    fill_in "Frecuencia bolillo", with: @cuestionario.frecuencia_bolillo
    fill_in "Frecuencia borrego", with: @cuestionario.frecuencia_borrego
    fill_in "Frecuencia chocolates", with: @cuestionario.frecuencia_chocolates
    fill_in "Frecuencia embutidos", with: @cuestionario.frecuencia_embutidos
    fill_in "Frecuencia frituras", with: @cuestionario.frecuencia_frituras
    fill_in "Frecuencia fruta", with: @cuestionario.frecuencia_fruta
    fill_in "Frecuencia galletas", with: @cuestionario.frecuencia_galletas
    fill_in "Frecuencia huevo", with: @cuestionario.frecuencia_huevo
    fill_in "Frecuencia insectos", with: @cuestionario.frecuencia_insectos
    fill_in "Frecuencia jugos", with: @cuestionario.frecuencia_jugos
    fill_in "Frecuencia leche", with: @cuestionario.frecuencia_leche
    fill_in "Frecuencia leguminosas", with: @cuestionario.frecuencia_leguminosas
    fill_in "Frecuencia pan", with: @cuestionario.frecuencia_pan
    fill_in "Frecuencia pescados mariscos", with: @cuestionario.frecuencia_pescados_mariscos
    fill_in "Frecuencia pollo", with: @cuestionario.frecuencia_pollo
    fill_in "Frecuencia puerco", with: @cuestionario.frecuencia_puerco
    fill_in "Frecuencia queso", with: @cuestionario.frecuencia_queso
    fill_in "Frecuencia refrescos", with: @cuestionario.frecuencia_refrescos
    fill_in "Frecuencia res", with: @cuestionario.frecuencia_res
    fill_in "Frecuencia salmon", with: @cuestionario.frecuencia_salmon
    fill_in "Frecuencia sandwich", with: @cuestionario.frecuencia_sandwich
    fill_in "Frecuencia sopas", with: @cuestionario.frecuencia_sopas
    fill_in "Frecuencia tacos", with: @cuestionario.frecuencia_tacos
    fill_in "Frecuencia tamales", with: @cuestionario.frecuencia_tamales
    fill_in "Frecuencia torta", with: @cuestionario.frecuencia_torta
    fill_in "Frecuencia tortillas", with: @cuestionario.frecuencia_tortillas
    fill_in "Frecuencia vegetales", with: @cuestionario.frecuencia_vegetales
    fill_in "Frecuencia yogurt", with: @cuestionario.frecuencia_yogurt
    fill_in "Glucosa", with: @cuestionario.glucosa
    fill_in "Hipertension", with: @cuestionario.hipertension
    fill_in "Insectos", with: @cuestionario.insectos
    fill_in "Localidad", with: @cuestionario.localidad
    fill_in "Nombre", with: @cuestionario.nombre
    fill_in "Obesidad", with: @cuestionario.obesidad
    fill_in "Origen carne", with: @cuestionario.origen_carne
    fill_in "Origen cereales", with: @cuestionario.origen_cereales
    fill_in "Origen frutas", with: @cuestionario.origen_frutas
    fill_in "Origen leche", with: @cuestionario.origen_leche
    fill_in "Origen vegetales", with: @cuestionario.origen_vegetales
    fill_in "Pais", with: @cuestionario.pais
    fill_in "Persona actividad", with: @cuestionario.persona_actividad
    fill_in "Peso", with: @cuestionario.peso
    fill_in "Sexo", with: @cuestionario.sexo
    fill_in "Sobrepeso", with: @cuestionario.sobrepeso
    fill_in "Trigliceridos", with: @cuestionario.trigliceridos
    fill_in "Valores embutidos", with: @cuestionario.valores_embutidos
    fill_in "Valores frituras", with: @cuestionario.valores_frituras
    fill_in "Valores galletas", with: @cuestionario.valores_galletas
    fill_in "Valores pan", with: @cuestionario.valores_pan
    fill_in "Valores pescados mariscos", with: @cuestionario.valores_pescados_mariscos
    fill_in "Valores tacos", with: @cuestionario.valores_tacos
    click_on "Update Cuestionario"

    assert_text "Cuestionario was successfully updated"
    click_on "Back"
  end

  test "destroying a Cuestionario" do
    visit cuestionarios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cuestionario was successfully destroyed"
  end
end
