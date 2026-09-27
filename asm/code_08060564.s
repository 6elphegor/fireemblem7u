	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08060564
sub_08060564: @ 0x08060564
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08060598 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806059C @ =0x08BA3BAC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _080605A0 @ =0x081E934E
	str r1, [r0, #0x48]
	ldr r1, _080605A4 @ =0x0829885C
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060598: .4byte 0x0201774C
_0806059C: .4byte 0x08BA3BAC
_080605A0: .4byte 0x081E934E
_080605A4: .4byte 0x0829885C
