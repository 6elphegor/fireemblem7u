	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806A9B4
sub_0806A9B4: @ 0x0806A9B4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806A9EA
	ldr r0, [r5, #0x5c]
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x48]
	ldr r3, [r5, #0x4c]
	ldr r4, [r5, #0x50]
	str r4, [sp]
	bl NewEkrTriArmorKnightOBJ
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xe2
	movs r3, #1
	bl PlaySFX
_0806A9EA:
	ldrh r0, [r5, #0x2c]
	cmp r0, #0x30
	bne _0806AA0E
	ldr r0, [r5, #0x5c]
	ldr r2, [r5, #0x44]
	ldr r3, [r5, #0x4c]
	movs r1, #0
	bl NewEkrTriArmorKnightOBJ2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xe2
	movs r3, #1
	bl PlaySFX
_0806AA0E:
	ldrh r0, [r5, #0x2c]
	cmp r0, #0x3c
	bne _0806AA24
	ldr r0, [r5, #0x5c]
	movs r1, #4
	bl NewEfxFlashBgWhite
	ldr r0, [r5, #0x5c]
	movs r1, #0xa
	bl NewEfxTriangleQUAKE
_0806AA24:
	ldrh r3, [r5, #0x2c]
	cmp r3, #0x4f
	bne _0806AA48
	ldr r0, [r5, #0x5c]
	ldr r2, [r5, #0x48]
	ldr r3, [r5, #0x50]
	movs r1, #1
	bl NewEkrTriArmorKnightOBJ2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xe2
	movs r3, #1
	bl PlaySFX
_0806AA48:
	ldrh r0, [r5, #0x2c]
	cmp r0, #0x5b
	bne _0806AA54
	ldr r1, _0806AA80 @ =0x02020134
	movs r0, #1
	str r0, [r1]
_0806AA54:
	ldrh r3, [r5, #0x2c]
	cmp r3, #0x60
	bne _0806AA6A
	ldr r0, [r5, #0x5c]
	movs r1, #4
	bl NewEfxFlashBgWhite
	ldr r0, [r5, #0x5c]
	movs r1, #0xa
	bl NewEfxTriangleQUAKE
_0806AA6A:
	ldrh r0, [r5, #0x2c]
	cmp r0, #0x78
	bne _0806AA76
	adds r0, r5, #0
	bl Proc_Break
_0806AA76:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806AA80: .4byte 0x02020134
