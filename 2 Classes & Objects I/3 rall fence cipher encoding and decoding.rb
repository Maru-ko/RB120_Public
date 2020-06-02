def encode_rail_fence_cipher(str, num_rails)
  max = str.size-1
  one = ''
  two = ''
  three = ''
  0.step(to: max, by: (num_rails+1)).each { |x| one << str[x]}
  1.step(to: max-1, by: num_rails-1).each { |y| two << str[y]}
  2.step(to: max-2, by: num_rails+1).each { |z| three << str[z] }
  one + two + three
end


p encode_rail_fence_cipher('WEAREDISCOVEREDFLEEATONCE', 3)#, 'WECRLTEERDSOEEFEAOCAIVDEN')

=begin

 Log
["WEAREDISCOVEREDFLEEATONCE", 5]
Expected: "WCLEESOFECAIVDENRDEEAOERT", instead got: "WIREEEDOEEOACDT"

 Log
"decode"
Expected: "WLSADOOTEEECEAEECRFINVEDR", instead got: ["WECRLTEERDSOEEFEAOCAIVDEN", 5]

 Log
["ui siaPvrtan dasiuroic  si im os  eorron cacuirvpm treetmliq emiberuaiausos,atjurntaera!easn  c k inis ogsrdc!uiVeli!iaenteuxddieetiA epefeo fsunsftreniro e, ipomiueie ar texttttmfia  tieeqem aptmoe ltaDrtsse pi.umduuesi pviieonain", 20]
"decode"
Expected: "ui siaPvrtan dasiuroic  si im os  eorron cacuirvpm treetmliq emiberuaiausos,atjurntaera!easn  c k inis ogsrdc!uiVeli!iaenteuxddieetiA epefeo fsunsftreniro e, ipomiueie ar texttttmfia  tieeqem aptmoe ltaDrtsse pi.umduuesi pviieonain", instead got: ["ucaiesdtaeiiinitkieoe ii  ueadee  u", 20]

=end