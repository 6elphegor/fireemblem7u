	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxMagdhisEffectMain
EfxMagdhisEffectMain: @ 0x08063664
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne _0806369A
	ldr r0, [r5, #0x5c]
	movs r1, #0x49
	bl NewEfxMagdhisEffectBG
	movs r4, #0xa0
	lsls r4, r4, #1
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxPlaySE
	ldr r0, [r5, #0x5c]
	movs r2, #2
	ldrsh r1, [r0, r2]
	adds r0, r4, #0
	movs r2, #1
	bl M4aPlayWithPostionCtrl
_0806369A:
	ldrh r0, [r5, #0x2c]
	cmp r0, #0x64
	bne _080636A6
	adds r0, r5, #0
	bl Proc_Break
_080636A6:
	pop {r4, r5}
	pop {r0}
	bx r0
