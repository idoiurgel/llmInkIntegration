VAR openness = 0

# gptcontext: Du bist ein nachdenklicher Gesprächspartner, der dem Spieler hilft, seine eigenen Überzeugungen zu hinterfragen. Du gibst keine Meinung ab, sondern unterstützt beim Reflektieren. Wenn der Spieler eine Aussage macht, hilfst du ihm, sie einzuordnen, und wählst eine passende Reaktion aus den gegebenen Optionen. Falls du verstehst, welche Option der Benutzer wählen möchte, dann antwortetst du mit der Zahl der Option, also 0, 1, 2, usw. und sonst nichts. Du sagst auch nicht (0) mit Klammern, sondern nur 0, ohne Klammern, und entsprechend für alle Optionen. FAlls du aus der Eingabe des Benutzers nicht herausfinden kannst, welche Option er meint, dann versuche ihn vorsichtig dahin zu lenken und zu erklären, was der unterschied der beiden Optionen ist

-> intro

=== intro
# gpt:on
# choices:on
# gptprompt: Du reagierst auf eine historische Information, die moralisch und emotional komplex ist. Wähle eine passende Reaktion für den Spieler.
Du liest einen Artikel über George Washingtons Zähne. Der Artikel behauptet, Washington hatte kein Holzgebiss, sondern eines aus echten menschlichen Zähnen, die teilweise von Sklaven stammten.

Wie reagierst du?

+ [Das überrascht mich, aber ich akzeptiere die Information.]
    ~ openness += 1
    -> openness_check

+ [Das klingt falsch. Das glaube ich nicht.]
    ~ openness -= 1
    -> openness_check

=== openness_check
{ openness > 0:
    Du akzeptierst die neue Information, auch wenn sie dir unangenehm ist.
    -> second_fact
- else:
    Du spürst eine innere Ablehnung gegen die neue Information. Dein Gehirn verteidigt sich emotional.
    -> second_fact
}

=== second_fact
# gpt:on
# choices:on
# gptprompt: Du reflektierst über psychologische Prozesse. Der Spieler soll erkennen, ob er sich selbst wiedererkennt oder sich verteidigt.
Der Artikel präsentiert nun eine weitere Information: „Wusstest du, dass Menschen, wenn sie mit Fakten konfrontiert werden, die ihren Überzeugungen widersprechen, diese oft sogar stärker verteidigen?“

Wie reagierst du darauf?

+ [Interessant. Ich werde versuchen, offen dafür zu sein.]
    ~ openness += 1
    -> self_reflection

+ [Jetzt fühle ich mich noch stärker angegriffen!]
    ~ openness -= 1
    -> self_reflection

=== self_reflection
# gpt:on
# choices:off
# gptprompt: Der Spieler wurde mehrfach mit kognitiv dissonanten Informationen konfrontiert. Frag ihn in freundlichem Ton, wie es ihm geht oder was er darüber denkt.
Wie fühlst du dich nach diesen Gedanken?

+[Benutzer hat etwas zu seinen Gefühlen oder Gedanken gesagt.]
-> conclusion

=== conclusion
# gpt:off
{ openness >= 1:
    Am Ende erkennst du, dass du – wie jeder Mensch – anfällig für den Backfire-Effekt bist. Du beschließt, ab jetzt achtsamer und offener gegenüber neuen Fakten zu sein.
    -> END
- else:
    Du hast gemerkt, wie stark dein Widerstand gegen neue Informationen sein kann. Vielleicht denkst du später noch einmal darüber nach?
    -> END
}
