	.include "macro.inc"

	.syntax unified

	thumb_func_start MapMenu_DangerZone_UnusedEffect
MapMenu_DangerZone_UnusedEffect: @ 0x080215D4
	push {lr}
	ldr r0, _080215F4 @ =0x03004690
	movs r1, #0
	str r1, [r0]
	ldr r0, _080215F8 @ =0x0202BBB8
	adds r0, #0x3e
	strb r1, [r0]
	ldr r0, _080215FC @ =0x08B93374
	bl Proc_Find
	movs r1, #0xc
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080215F4: .4byte 0x03004690
_080215F8: .4byte 0x0202BBB8
_080215FC: .4byte 0x08B93374
