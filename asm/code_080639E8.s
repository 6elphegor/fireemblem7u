	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxChillEffectMain
EfxChillEffectMain: @ 0x080639E8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08063A08
	ldr r0, [r4, #0x5c]
	bl NewEfxChillEffectBG
	ldr r0, [r4, #0x5c]
	bl NewEfxChillEffectBGCOL
	b _08063A24
_08063A08:
	cmp r0, #3
	beq _08063A10
	cmp r0, #0x11
	bne _08063A1A
_08063A10:
	ldr r0, [r4, #0x5c]
	movs r1, #5
	bl NewEfxFlashBgBlack
	b _08063A24
_08063A1A:
	cmp r0, #0x24
	bne _08063A24
	adds r0, r4, #0
	bl Proc_Break
_08063A24:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
