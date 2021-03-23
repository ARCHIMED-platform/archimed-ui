using Blink, WebSockets, WebIO, Interact, Observables, CSSUtil, Markdown, ImageShow, Colors



##########################Tbbed menu###########################

#Buttons as an ordred Dict


tab= Widget{:test}(OrderedDict(
  #rgb(164, 214, 225)
    :btn_input=>button("Input", style=Dict(:background=>"rgba(122, 199, 199, 0.62)", :color=>"black", :size=>"20px")),#:border=>"solid 1px")),
    :btn_sim=>button("Simulation", style=Dict(:border=>"solid 1px",:background=>"rgba(196, 196, 196, 0.62)",:color=>"black", :size=>"20px")),#:border=>"solid 1px")),
    :btn_output=>button("Output",style=Dict(:border=>"solid 1px",:background=>"rgba(196, 196, 196, 0.62)",:color=>"black",:size=>"10em")),#)#:border=>"solid 1px"))
    :btn_set=>button("Settings", style=Dict(:background=>"rgba(122, 199, 199, 0.62)", :color=>"black",:fontsize=>"10px")),#:border=>"solid 1px"))
    :btn_scm=>button("Scene/Model", style=Dict(:background=>"rgba(122, 199, 199, 0.62)",:color=>"black",:fontsize=>"10px",:border=>"solid 1px")),
    :btn_meteo=>button("Meteo",style=Dict(:background=>"rgba(122, 199, 199, 0.62)",:color=>"black",:fontsize=>"10px",:border=>"solid 1px"))))

    @layout! tab vbox(hbox(:btn_input,:btn_sim,:btn_output),hbox(:btn_set,:btn_scm,:btn_meteo))
display(tab)

#Show the result
#w= Window()
#body!(w,tab)

#######################Information Icon#################################

icon=
Node(
        #hskip(100em),
        :div,
        dom"img"(src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAYAAABWdVznAAABXklEQVQokXVRy07CUBS8+B82sYkE2gCVRJT4I0TiPxS4LZQVon8juOKlXKy90ZUgid6qK1wQDSXRaELE3bjANKHi7CYz52TOGUICiPNyUmFmVu0W9+O8nAzqPtSWsRdl5q3U0yE7BmTHgMR0RHvmINam6eWtZ9bOZrfwrXILVVGH7bmwPYFDUYPCLYQZnSc6ZmrhRmUt0si5KrfAvQcEcem5ULiFSCN/T4AQiXeM5DrTceye+qbRzMPzbOrzI7cOielQzw2NRDuFA9mhuJo++QbxMYb7OfY5nz5iw6FQWoXsyoHmyxCt1+HqgUS3tCUFIvXfRhi8j3xeFb+ROsUEARCKNHJC4RYuPffP0fZELI5u5u4IECKEEJLomakwo3OFW6iIGi4mAr2JQEWcLN7aLXxp7dL2UhexNk1HGe1LTIfsUMgOXRTHzJt4K7/7b+PadVlT7WJGtYsZzS5rQf0HFSNALodgStgAAAAASUVORK5CYII=")
)                    


##########################Left-side, Parameters 1= Textboxes###########################

# Create parameters inputs and Display them on the left side . The position of the "style=Dict()" has no effect on the results

optionsd = Observable(["1", "6", "16", "46", "136","406"])
#wdgd = dropdown(options, label="Sky sectors")
optionsd[] = ["1", "6", "16", "46", "136","406"]


config_file=filepicker(label="Choose the config file", style=Dict(:color=>"black"); multiple=false, accept=".yml")

sky_sector=dropdown(optionsd, label="Sky sectors")

scene_rotation=textbox(style=Dict(:border=>"solid 1px",:background=>"white", :color=>"black", :size=>"10px"),
        label = "Scene rotation",
        value = "0")
        #style=Dict(:border=>"solid 1px",:background=>"rgba(184, 244, 190, 0.36)", :color=>"black", :size=>"10px")),

radiation_tps=textbox(label = "Radiation timestep",
        value = "5", 
        style=Dict(:border=>"solid 1px",:background=>"white", :color=>"black", :size=>"10px"))
 
pixel_size=textbox(label = "Pixel size",
        value = "0.3", 
        style=Dict(:border=>"solid 1px",:background=>"white", :color=>"black", :size=>"10px"))
        


param1=vbox(
        vskip(50px),
        hbox(hskip(150px),
        icon,hskip(5px),config_file),
        vskip(50px),#hskip(148px),
        hbox(hskip(120px),
        icon,hskip(5px),sky_sector),
        vskip(20px),hbox(icon,hskip(5px),scene_rotation),vskip(10px),hbox(icon,hskip(5px),radiation_tps), vskip(10px),hbox(icon,hskip(5px),pixel_size))
        
#Show the result
w= Window()
body!(w,param1)



#############################Right-side Parameters 2 = Radio Buttons#######################

# Create radiobottuns True/False and display them on the right side


optionsr = Observable(["True", "False"])
#wdgr = radiobuttons(options)
optionsr[] = ["True", "False"]


All_in_turtle= radiobuttons(optionsr,label="All in turtle")

scattering=radiobuttons(optionsr,label="Scattering", 
         style=Dict(:border=>"solid 1px",:background=>"rgba(184, 244, 190, 0.36)", :color=>"black", :size=>"10px"))

toricity= radiobuttons(optionsr,label="Toricity",
        style=Dict(:border=>"solid 1px",:background=>"rgba(184, 244, 190, 0.36)", :color=>"black", :size=>"10px"))


cache_pixel_table= radiobuttons(optionsr,label="Cache pixel table")


cache_radiation= radiobuttons(optionsr,label="Cache radiation")



param2=vbox(hbox(icon,All_in_turtle,icon,scattering,icon,toricity),
   hbox(icon,cache_pixel_table,hskip(50px),icon,cache_radiation) 
)


param2= vbox(
        vskip(50px),
        hbox(hbox(hskip(10px),
        icon,hskip(5px),All_in_turtle),hbox(icon,hskip(5px),scattering),hbox(icon,hskip(5px),toricity)),
        vskip(20px),#hskip(148px),
        hbox(hbox(hskip(10px),
        icon,hskip(5px),cache_pixel_table), hbox(hskip(20px),icon,hskip(5px),cache_radiation)))
        
        vskip(20px),
        hbox(icon,hskip(5px),scene_rotation),
        vskip(10px),
        hbox(icon,hskip(5px),radiation_tps), 
        vskip(10px),
        hbox(icon,hskip(5px),pixel_size)




#Show the result
w= Window()
body!(w,param2)

# WARNING : Don't execute this code. this is the first(draft) way to buil param2


optionsr = Observable(["True", "False"])
#wdgr = radiobuttons(options)
optionsr[] = ["True", "False"]

param2=vbox(hbox(
    dom"img"(src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAYAAABWdVznAAABXklEQVQokXVRy07CUBS8+B82sYkE2gCVRJT4I0TiPxS4LZQVon8juOKlXKy90ZUgid6qK1wQDSXRaELE3bjANKHi7CYz52TOGUICiPNyUmFmVu0W9+O8nAzqPtSWsRdl5q3U0yE7BmTHgMR0RHvmINam6eWtZ9bOZrfwrXILVVGH7bmwPYFDUYPCLYQZnSc6ZmrhRmUt0si5KrfAvQcEcem5ULiFSCN/T4AQiXeM5DrTceye+qbRzMPzbOrzI7cOielQzw2NRDuFA9mhuJo++QbxMYb7OfY5nz5iw6FQWoXsyoHmyxCt1+HqgUS3tCUFIvXfRhi8j3xeFb+ROsUEARCKNHJC4RYuPffP0fZELI5u5u4IECKEEJLomakwo3OFW6iIGi4mAr2JQEWcLN7aLXxp7dL2UhexNk1HGe1LTIfsUMgOXRTHzJt4K7/7b+PadVlT7WJGtYsZzS5rQf0HFSNALodgStgAAAAASUVORK5CYII="),
    radiobuttons(optionsr,label="All in turtle"),
    dom"img"(src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAYAAABWdVznAAABXklEQVQokXVRy07CUBS8+B82sYkE2gCVRJT4I0TiPxS4LZQVon8juOKlXKy90ZUgid6qK1wQDSXRaELE3bjANKHi7CYz52TOGUICiPNyUmFmVu0W9+O8nAzqPtSWsRdl5q3U0yE7BmTHgMR0RHvmINam6eWtZ9bOZrfwrXILVVGH7bmwPYFDUYPCLYQZnSc6ZmrhRmUt0si5KrfAvQcEcem5ULiFSCN/T4AQiXeM5DrTceye+qbRzMPzbOrzI7cOielQzw2NRDuFA9mhuJo++QbxMYb7OfY5nz5iw6FQWoXsyoHmyxCt1+HqgUS3tCUFIvXfRhi8j3xeFb+ROsUEARCKNHJC4RYuPffP0fZELI5u5u4IECKEEJLomakwo3OFW6iIGi4mAr2JQEWcLN7aLXxp7dL2UhexNk1HGe1LTIfsUMgOXRTHzJt4K7/7b+PadVlT7WJGtYsZzS5rQf0HFSNALodgStgAAAAASUVORK5CYII="),
    radiobuttons(optionsr,label="Scattering", 
             style=Dict(:border=>"solid 1px",:background=>"rgba(184, 244, 190, 0.36)", :color=>"black", :size=>"10px")),
             dom"img"(src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAYAAABWdVznAAABXklEQVQokXVRy07CUBS8+B82sYkE2gCVRJT4I0TiPxS4LZQVon8juOKlXKy90ZUgid6qK1wQDSXRaELE3bjANKHi7CYz52TOGUICiPNyUmFmVu0W9+O8nAzqPtSWsRdl5q3U0yE7BmTHgMR0RHvmINam6eWtZ9bOZrfwrXILVVGH7bmwPYFDUYPCLYQZnSc6ZmrhRmUt0si5KrfAvQcEcem5ULiFSCN/T4AQiXeM5DrTceye+qbRzMPzbOrzI7cOielQzw2NRDuFA9mhuJo++QbxMYb7OfY5nz5iw6FQWoXsyoHmyxCt1+HqgUS3tCUFIvXfRhi8j3xeFb+ROsUEARCKNHJC4RYuPffP0fZELI5u5u4IECKEEJLomakwo3OFW6iIGi4mAr2JQEWcLN7aLXxp7dL2UhexNk1HGe1LTIfsUMgOXRTHzJt4K7/7b+PadVlT7WJGtYsZzS5rQf0HFSNALodgStgAAAAASUVORK5CYII="),
    radiobuttons(optionsr,label="Toricity",
            style=Dict(:border=>"solid 1px",:background=>"rgba(184, 244, 190, 0.36)", :color=>"black", :size=>"10px")),
            dom"img"(src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAYAAABWdVznAAABXklEQVQokXVRy07CUBS8+B82sYkE2gCVRJT4I0TiPxS4LZQVon8juOKlXKy90ZUgid6qK1wQDSXRaELE3bjANKHi7CYz52TOGUICiPNyUmFmVu0W9+O8nAzqPtSWsRdl5q3U0yE7BmTHgMR0RHvmINam6eWtZ9bOZrfwrXILVVGH7bmwPYFDUYPCLYQZnSc6ZmrhRmUt0si5KrfAvQcEcem5ULiFSCN/T4AQiXeM5DrTceye+qbRzMPzbOrzI7cOielQzw2NRDuFA9mhuJo++QbxMYb7OfY5nz5iw6FQWoXsyoHmyxCt1+HqgUS3tCUFIvXfRhi8j3xeFb+ROsUEARCKNHJC4RYuPffP0fZELI5u5u4IECKEEJLomakwo3OFW6iIGi4mAr2JQEWcLN7aLXxp7dL2UhexNk1HGe1LTIfsUMgOXRTHzJt4K7/7b+PadVlT7WJGtYsZzS5rQf0HFSNALodgStgAAAAASUVORK5CYII="),
    radiobuttons(optionsr,label="Toricity")),vline(),vskip(30px),
hbox(
    dom"img"(src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAYAAABWdVznAAABXklEQVQokXVRy07CUBS8+B82sYkE2gCVRJT4I0TiPxS4LZQVon8juOKlXKy90ZUgid6qK1wQDSXRaELE3bjANKHi7CYz52TOGUICiPNyUmFmVu0W9+O8nAzqPtSWsRdl5q3U0yE7BmTHgMR0RHvmINam6eWtZ9bOZrfwrXILVVGH7bmwPYFDUYPCLYQZnSc6ZmrhRmUt0si5KrfAvQcEcem5ULiFSCN/T4AQiXeM5DrTceye+qbRzMPzbOrzI7cOielQzw2NRDuFA9mhuJo++QbxMYb7OfY5nz5iw6FQWoXsyoHmyxCt1+HqgUS3tCUFIvXfRhi8j3xeFb+ROsUEARCKNHJC4RYuPffP0fZELI5u5u4IECKEEJLomakwo3OFW6iIGi4mAr2JQEWcLN7aLXxp7dL2UhexNk1HGe1LTIfsUMgOXRTHzJt4K7/7b+PadVlT7WJGtYsZzS5rQf0HFSNALodgStgAAAAASUVORK5CYII="),
    radiobuttons(optionsr,label="Cache pixel table"),hskip(50px),
    dom"img"(src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAYAAABWdVznAAABXklEQVQokXVRy07CUBS8+B82sYkE2gCVRJT4I0TiPxS4LZQVon8juOKlXKy90ZUgid6qK1wQDSXRaELE3bjANKHi7CYz52TOGUICiPNyUmFmVu0W9+O8nAzqPtSWsRdl5q3U0yE7BmTHgMR0RHvmINam6eWtZ9bOZrfwrXILVVGH7bmwPYFDUYPCLYQZnSc6ZmrhRmUt0si5KrfAvQcEcem5ULiFSCN/T4AQiXeM5DrTceye+qbRzMPzbOrzI7cOielQzw2NRDuFA9mhuJo++QbxMYb7OfY5nz5iw6FQWoXsyoHmyxCt1+HqgUS3tCUFIvXfRhi8j3xeFb+ROsUEARCKNHJC4RYuPffP0fZELI5u5u4IECKEEJLomakwo3OFW6iIGi4mAr2JQEWcLN7aLXxp7dL2UhexNk1HGe1LTIfsUMgOXRTHzJt4K7/7b+PadVlT7WJGtYsZzS5rQf0HFSNALodgStgAAAAASUVORK5CYII="),
    radiobuttons(optionsr,label="Cache radiation"))

)


        

#Test
#essai=hbox(img,radio1)

#w=Window()
#body!(w,essai)

# create a div to push down parameters2 (radiobuttons of the right side)

divparam2= Node(
        :div,
      #"hello world",
       style=Dict(
        :backgroundColor => "rgba(241, 247, 213, 0.25)",#rgba(241, 247, 213, 0.39)
        #:padding=>"70px"
        #:border=>"solid"

    ),
    
)


# Put the div on top of radiobuttons(parameter 2)

param2bis=vbox(divparam2,vline(),vskip(77px), hbox(param2,vline()) #param2#param2#, vline() #hbox(param2, #div2)

)


# Show the result
w= Window()
body!(w,param2bis)


#essayer de faire le merge de param1 avec le node (:div avc background vert 
#avant de rajouter la div2 à droite de param2 pour vérifier si la couleur du background change )

div1= Node(
        #hskip(100em),
        :div,
        
        #Add a vertical line
       style=Dict(
        :backgroundColor => "white",#rgba(196, 196, 196, 0.18)#rgba(241, 247, 213, 0.39)rgba(241, 247, 213, 0.25)
       :padding=>"60px",
        #:border=>"solid 1px grey"

    ),
    
)


#Test : Add div1 on the left of param1
param_1=hbox(#div1,
vline(),
param1)

# Show the result
w= Window()
body!(w,param_1)


logo=

Node(
        #hskip(100em),
        :div,
        dom"img"(src= "data:image/jpeg;base64,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")
        
)

# WARNINH : logo test WARNING : Don't execute this code.
vbox(
#vskip(50px),
#dom"img"(src= "data:image/jpeg;base64,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"),
vskip(400px),
dom"img"(src= "data:image/jpeg;base64,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")
)


# Create a div to put on the rignt of radiobuttons(param2) and on the left of textboxes(param1)
div2= Node(
        #hskip(100em),
        :div,
     
       style=Dict(
        :backgroundColor => "#dcdadb",#rgba(196, 196, 196, 0.18)#rgba(241, 247, 213, 0.39)rgba(241, 247, 213, 0.25)
        #:padding=>"50px"#100px
        #:border=>"solid 0.07px grey"#rgba(111, 188, 96, 1)

    ),
    
)


#put the div2 on the right side of param2 (radio_buttons)
# Merge div2 on the right with param_2

param_2=hbox(param2bis, #vline())
div2)


#param_2=hbox(param2line,CSSUtil.vline(),div2)

# Show the result
w= Window()
body!(w,param_2)




#Merge left side(param1) and right side(param2)
param_12=hbox(param_1,param2bis)#_1
#,param_2)#, vline())
w= Window()
body!(w,param_12)

#Add a colored background div to param_12
param_all= Node(
        :div,
        #hskip(1000em),

        #hbox(vbox(
         #       dom"img"(src= "data:image/jpeg;base64,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"),
         #       vskip(100px),
       #logo,
#vline(),                
param_12,
style=Dict(
        :backgroundColor => "rgba(241, 247, 213, 0.53)",#vert clair=rgba(184, 244, 190, 0.36)rgba(241, 247, 213, 0.53)rgba(241, 247, 213, 0.39)
        :color => "black",
        #:padding=>"300px"
        #:border=>"solid 0.2px "#rgba(111, 188, 96, 1) = green

    ),
)

w= Window()
body!(w,param_all)


# Add CIRAD logo on the left 
ui1=hbox(vbox(vskip(300px),#vbox(div1,vskip(300px),
logo),
param_all)  # ui1=hbox(logo,param_all) 
w=Window()
body!(w,ui1)

#Merge tab buttons with ui1 add div2 on the right to leave a space
ui2=vbox(
    hbox(hskip(163px),tab),hbox(ui1,div2,hskip(20px),div2)
    )

w= Window()
body!(w,ui2)

# Add the top menu buttons to all (put all in a div)

UI=Node(
    :div,
    node(:button,"File"),
    node(:button,"Edit"),
    node(:button,"Help"),
    vskip(50px),#hskip(1000em),
   
        ui2,
       
    #)
    
    hbox(hskip(600px),dom"img"(src="data:image/png;base64,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")),#E:/Stage_julia/Maquette/img/logo.png
    style=Dict(
        :backgroundColor => "white",
        :color => "black",
        #:padding=>"300px"
       :border=>"solid 1px grey"#black
    ),

)

w= Window()
body!(w,UI)
















###########"#Some tests#################################################

uitest=hbox(
        vbox(
         dom"img"(src= "data:image/jpeg;base64,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"),
         vskip(300px),
         dom"img"(src= "data:image/jpeg;base64,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")),
vline(), param_all,div2         
)

w= Window()
body!(w,uitest)








#uitest2=hbox(div1,param_all,div2)

#w= Window()
#body!(w,uitest2)