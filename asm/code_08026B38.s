	.include "macro.inc"

	.syntax unified

	thumb_func_start GetAffinityIconByPid
GetAffinityIconByPid: @ 0x08026B38
	push {lr}
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _08026B48
	adds r0, #0x79
	b _08026B4C
_08026B48:
	movs r0, #1
	rsbs r0, r0, #0
_08026B4C:
	pop {r1}
	bx r1
