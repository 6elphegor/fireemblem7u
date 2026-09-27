	.include "macro.inc"

	.syntax unified

	thumb_func_start MenuCommand_SelectYes
MenuCommand_SelectYes: @ 0x08022798
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080227C4 @ =0x03004690
	ldr r0, [r0]
	ldr r4, _080227C8 @ =0x0203A85C
	ldrb r1, [r4, #0x12]
	bl UnitRemoveItem
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	beq _080227B6
	ldr r0, _080227CC @ =0x02022C60
	movs r1, #0
	bl TmFill
_080227B6:
	adds r0, r5, #0
	bl sub_0802245C
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080227C4: .4byte 0x03004690
_080227C8: .4byte 0x0203A85C
_080227CC: .4byte 0x02022C60
