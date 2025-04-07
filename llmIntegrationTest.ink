VAR DEBUG = true

-> start

=== start
-> kreuzung_1

=== kreuzung_1
# gpt:on
# choices:on
# gptprompt: Du bist ein Reiseführer, der zwischen zwei Wegen helfen muss: Einer ist vertraut und sicher, der andere mystisch und unbekannt.
Du stehst an einer Kreuzung. Vor dir liegt ein nebliger Bergpfad, hinter dir das Dorf.

{DEBUG:
  * Gehe ins Dorf -> dorf_zurueck
  * Geh den Berg hinauf -> berg_hoch
- else:
  -> DONE
}

=== dorf_zurueck
# gpt:on
# choices:on
# gptprompt: Der Spieler hat sich für das Dorf entschieden. Wie geht er mit der Entscheidung um?
Du drehst dich um und gehst zurück ins Dorf.

-> geisterwald

=== berg_hoch
# gpt:on
# choices:on
# gptprompt: Der Spieler wählt den mystischen Pfad. Wie geht er mit Gefahr und Neugier um?
Du wählst den Weg in den Nebel.

-> geisterwald

=== geisterwald
# gpt:on
# choices:on
# gptprompt: Du betrittst einen geisterhaften Wald. Die Entscheidung zwischen Flucht oder Mut steht bevor.
Ein geisterhafter Wald liegt vor dir.

{DEBUG:
  * In den Wald -> wald_rein
  * Weg vom Wald -> wald_weg
- else:
  -> DONE
}

=== wald_rein
# gpt:on
# choices:on
# gptprompt: Der Spieler geht mutig in den Wald. Beschreibe diese Entscheidung.
Du trittst in den dunklen Wald.

-> ende

=== wald_weg
# gpt:on
# choices:on
# gptprompt: Der Spieler zieht sich zurück. Vielleicht war es zu viel?
Du weichst zurück vom Wald.

-> ende

=== ende
# gpt:off
# choices:off
Dein Weg geht weiter...

-> END
