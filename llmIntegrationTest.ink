# gptcontext: Du bist ein erfahrener Reiseführer, der den Spieler durch eine geheimnisvolle Welt begleitet. Du hilfst mit klugen, kurzen Entscheidungen in Form von Zahlen (z. B. 0 oder 1). Wenn du den Spieler nicht verstehst, fragst du nach.

-> start

=== start
-> kreuzung_1

=== kreuzung_1
# gpt:on
# choices:on
# gptprompt: Du bist ein erfahrener Reiseführer. Hilf dem Spieler, sich zwischen Sicherheit (Dorf) und Abenteuer (Berg) zu entscheiden. Du bekommst die Information, welche die Optionen sind. Du antwortest mit einer Zahl, z.B. 0 oder 1, wenn du verstehst, welche Option am besten für der Nutzer ist. Wenn du nicht verstehst, fragst du nach.
Du stehst an einer Kreuzung. Vor dir liegt ein nebliger Bergpfad, hinter dir das Dorf.

* Gehe ins Dorf -> dorf_zurueck
* Geh den Berg hinauf -> berg_hoch

=== dorf_zurueck
# gpt:on
# choices:on
Du drehst dich um und gehst zurück ins Dorf.

-> geisterwald

=== berg_hoch
# gpt:on
# choices:on
Du wählst den Weg in den Nebel.

-> geisterwald

=== geisterwald
# gpt:on
# choices:on
# gptprompt: Der Wald wirkt unheimlich. Du musst entscheiden, ob du deinen Mut sammelst oder dich lieber zurückziehst.
Ein geisterhafter Wald liegt vor dir.

* In den Wald -> wald_rein
* Weg vom Wald -> wald_weg

=== wald_rein
# gpt:on
# choices:off
# gptprompt: Du betrittst den dunklen Wald. Was willst du tun – leise voranschleichen oder laut deinen Namen rufen?
Die Äste knacken unter deinen Füßen. Es ist still. Zu still.

-> tempel_odyssee

=== wald_weg
# gpt:off
# choices:on
Du weichst zurück vom Wald.

* Zurück zur Kreuzung -> kreuzung_1

=== tempel_odyssee
# gpt:on
# choices:on
# gptprompt: Du stehst nun vor zwei Wegen: Einer führt in einen alten Tempel, der andere tiefer in die Wildnis. Was ist weiser?
Ein verfallener Tempel liegt links, rechts ein Trampelpfad ins Dickicht.

* Tempel betreten -> tempel_betreten
* Pfad folgen -> tiefer_wald

=== tempel_betreten
# gpt:off
# choices:on
Du schiebst das schwere Steintor auf.

* Weiter → -> finale
* Zurück → -> geisterwald

=== tiefer_wald
# gpt:on
# choices:on
# gptprompt: Du bist nun tief in der Wildnis. Der Spieler fühlt sich beobachtet. Soll er sich verstecken oder laut um Hilfe rufen?
Büsche rascheln. Augen starren dich aus dem Dunkel an.

* Verstecken -> verstecken
* Rufen -> rufen

=== verstecken
# gpt:off
# choices:off
Du kauerst dich ins Unterholz. Alles wird still.

-> finale

=== rufen
# gpt:off
# choices:off
Dein Ruf hallt durch die Bäume – keine Antwort.

-> finale

=== finale
# gpt:off
# choices:off
Ein Licht erscheint am Horizont. Dein Abenteuer endet hier – für den Moment.

-> END
