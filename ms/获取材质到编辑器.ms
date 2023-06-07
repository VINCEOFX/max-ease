macroScript AddSelectedMaterialsToMeditMaterials
category: "#todorScripts"
toolTip: "将选中的对象材质添加到 meditMaterials 中"
buttonText: "添加选中材质"
(
    -- 定义一个用于存储选中对象材质的数组
    selectedMaterials = #()

    -- 获取当前选中的对象
    selectedObjects = selection as array

    -- 遍历选中的每个对象
    for obj in selectedObjects do
    (
        -- 获取对象的材质
        objMaterial = obj.material

        -- 如果对象有材质，则将其添加到 selectedMaterials 中
        if objMaterial != undefined then
        (
            append selectedMaterials objMaterial
        )
    )

    -- 将 selectedMaterials 中的所有材质添加到 meditMaterials 中
    for i = 1 to selectedMaterials.count do
    (
        meditMaterials[i] = selectedMaterials[i]
    )
)
