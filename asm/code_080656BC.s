	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrDragonTunkFace
NewEkrDragonTunkFace: @ 0x080656BC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0806570C @ =0x08BD93E0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r0, _08065710 @ =0x082E1A30
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterObjGfx
	ldr r0, _08065714 @ =0x082E4064
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08065718 @ =0x08BDAC58
	movs r1, #0x14
	bl AnimCreate
	movs r2, #0
	movs r1, #0xa1
	lsls r1, r1, #6
	strh r1, [r0, #8]
	movs r1, #0xc0
	lsls r1, r1, #1
	strh r1, [r4, #0x32]
	strh r1, [r0, #2]
	strh r1, [r4, #0x3a]
	strh r1, [r0, #4]
	str r0, [r4, #0x60]
	adds r0, r4, #0
	adds r0, #0x29
	strb r2, [r0]
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806570C: .4byte 0x08BD93E0
_08065710: .4byte 0x082E1A30
_08065714: .4byte 0x082E4064
_08065718: .4byte 0x08BDAC58
