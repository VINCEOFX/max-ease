macroScript MaterialRenamer
	category: "#todorScripts"
	toolTip: "材质重命名脚本"
(
	rollout Grupper "材质重命名脚本" width:200 height:334
	(
		radioButtons 'RadioButtons1' "选择类型：" pos:[20,20] width:134 height:30 labels:#("选中物体", "全部物体") default:2 columns:2 align:#left

		checkbox 'BaseName' "基础名称：" pos:[20,85] width:80 height:20 align:#left
		editText 'BNInput' "" pos:[105,85] width:84 height:16 align:#left

		checkbox 'Prefix' "前缀：" pos:[20,110] width:80 height:20 align:#left
		editText 'PrefixInput' ""  pos:[105,110] width:84 height:16 align:#left

		checkbox 'Suffix' "后缀：" pos:[20,135] width:80 height:20 align:#left
		editText 'SuffixInput' ""  pos:[105,135] width:84 height:16 align:#left

		checkbox 'Numbered' "编号：" pos:[20,190] width:80 height:20 align:#left
		editText 'Startby' "起始编号： "  pos:[56,213] width:120 height:16 align:#left
		editText 'Step' "编号步长： "  pos:[56,239] width:120 height:16 align:#left
		button 'Rename' "重命名" pos:[25,288] width:156 height:27 align:#left


		-- 关于
		groupBox grp1 "关于" pos:[12,330] width:180 height:100

		-- 标签
		label lbl2 "物体选择器 v1.0" pos:[29,350] width:140 height:54 enabled:true
		label lbl3 "作者：Todor Vankov" pos:[29,365] width:140 height:54 enabled:true
		label lbl4 "点击访问我的网站：" pos:[29,390] width:140 height:54 enabled:true
		hyperLink mysite "www.todorvankov.com" address:"www.todorvankov.com" color:[206,255,255] pos:[29,405]


		on Rename pressed do
		(
			i = Startby.text as integer

			if RadioButtons1.state == 1 then (
				surchAmount = selection as Array
			) else (
				surchAmount = geometry as Array
			)

			for obj in surchAmount do (
				if obj.material != undefined then (
					-- 1 1 1
					if BaseName.checked == true and Prefix.checked == true and Suffix.checked == true then (
						obj.material.name = PrefixInput.text + BNInput.text + SuffixInput.text
					)

					-- 1 1 0
					if BaseName.checked == true and Prefix.checked == true and Suffix.checked == false then (
						obj.material.name = PrefixInput.text + BNInput.text
					)

					-- 1 0 0
					if BaseName.checked == true and Prefix.checked == false and Suffix.checked == false then (
						obj.material.name = BNInput.text
					)

					-- 0 1 1
					if BaseName.checked == false and Prefix.checked == true and Suffix.checked == true then (
						obj.material.name = PrefixInput.text + obj.material.name + SuffixInput.text
					)

					-- 0 0 1
					if BaseName.checked == false and Prefix.checked == false and Suffix.checked == true then (
						obj.material.name = obj.material.name + SuffixInput.text
					)

					-- 0 1 0
					if BaseName.checked == false and Prefix.checked == true and Suffix.checked == false then (
						obj.material.name = PrefixInput.text + obj.material.name
					)

					-- 1 0 1
					if BaseName.checked == true and Prefix.checked == false and Suffix.checked == true then (
						obj.material.name = BNInput.text + SuffixInput.text
					)

					if Numbered.checked == true then (
						obj.material.name = obj.material.name + "_" + ((i * (Step.text as integer))as String)
						i = i + 1
					)
				)
			)

		)

		on RadioButtons1 changed stat do (
		)

		on BaseName changed state do (
		)

		on BNInput entered text do (
		)

		on Prefix changed state do (
		)

		on PrefixInput entered text do (
		)

		on Suffix changed state do (
		)

		on SuffixInput entered text do (
		)

		on Numbered changed state do (
		)

		on edt6 entered text do (
		)

		on edt7 entered text do (
		)
	)

	on Execute do (
		palisadeFloater = NewRolloutFloater "材质重命名脚本" 220 470
		addRollout Grupper palisadeFloater
	)
)