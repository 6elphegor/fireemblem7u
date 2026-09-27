	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxChillEffectBG
NewEfxChillEffectBG: @ 0x08063A2C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08063A70 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08063A74 @ =0x08BA46A4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _08063A78 @ =0x081E973A
	str r1, [r0, #0x48]
	ldr r1, _08063A7C @ =0x08BA46BC
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _08063A80 @ =0x08296F50
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063A70: .4byte 0x0201774C
_08063A74: .4byte 0x08BA46A4
_08063A78: .4byte 0x081E973A
_08063A7C: .4byte 0x08BA46BC
_08063A80: .4byte 0x08296F50
