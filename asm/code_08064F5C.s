	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragon_PreMainBodyIntro
EkrDragon_PreMainBodyIntro: @ 0x08064F5C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r6, [r5, #0x64]
	ldr r0, _08064F80 @ =0x0203E02C
	ldrh r0, [r0]
	cmp r0, #2
	bne _08064F84
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldr r0, [r5, #0x5c]
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	adds r0, r5, #0
	bl Proc_Break
	b _08064FDA
	.align 2, 0
_08064F80: .4byte 0x0203E02C
_08064F84:
	movs r0, #0x34
	ldrsh r2, [r6, r0]
	adds r1, r2, #0
	subs r1, #0x30
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r4, #0x10
	str r4, [sp]
	movs r0, #1
	bl Interpolate
	strh r0, [r6, #0x32]
	movs r0, #0x3c
	ldrsh r2, [r6, r0]
	adds r1, r2, #0
	subs r1, #0x80
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	str r4, [sp]
	movs r0, #1
	bl Interpolate
	strh r0, [r6, #0x3a]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne _08064FDA
	ldr r0, [r5, #0x64]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldr r0, [r5, #0x5c]
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	adds r0, r5, #0
	bl Proc_Break
_08064FDA:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
