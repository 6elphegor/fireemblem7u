	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrClasschgBG2
NewEkrClasschgBG2: @ 0x08068584
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080685B4 @ =0x08BDB3B8
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _080685B8 @ =0x082E5BAA
	str r1, [r0, #0x48]
	ldr r1, _080685BC @ =0x08BDB3D0
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _080685C0 @ =0x08BDB42C
	str r1, [r0, #0x54]
	ldr r1, _080685C4 @ =0x08BDB488
	str r1, [r0, #0x58]
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080685B4: .4byte 0x08BDB3B8
_080685B8: .4byte 0x082E5BAA
_080685BC: .4byte 0x08BDB3D0
_080685C0: .4byte 0x08BDB42C
_080685C4: .4byte 0x08BDB488
