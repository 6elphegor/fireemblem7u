	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BD424
sub_080BD424: @ 0x080BD424
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	mov sb, r3
	ldr r1, [sp, #0x18]
	ldr r0, _080BD4BC @ =0x08CEF444
	bl Proc_Start
	lsls r1, r4, #0x10
	str r1, [r0, #0x34]
	lsls r6, r6, #0x10
	str r6, [r0, #0x3c]
	adds r4, #0x80
	movs r1, #0xff
	mov r8, r1
	ands r4, r1
	lsls r4, r4, #0x10
	str r4, [r0, #0x38]
	adds r6, #0x20
	str r6, [r0, #0x40]
	ldr r3, _080BD4C0 @ =0x080C5A48
	adds r2, r5, #0
	ands r2, r1
	adds r1, r2, #0
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r4, #0
	ldrsh r1, [r1, r4]
	mov r4, sb
	muls r4, r1, r4
	adds r1, r4, #0
	str r1, [r0, #0x44]
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r4, #0
	ldrsh r1, [r2, r4]
	mov r2, sb
	muls r2, r1, r2
	adds r1, r2, #0
	str r1, [r0, #0x4c]
	adds r5, #4
	mov r4, r8
	ands r5, r4
	adds r1, r5, #0
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r2, #0
	ldrsh r1, [r1, r2]
	mov r4, sb
	muls r4, r1, r4
	adds r1, r4, #0
	str r1, [r0, #0x48]
	lsls r5, r5, #1
	adds r5, r5, r3
	movs r2, #0
	ldrsh r1, [r5, r2]
	mov r4, sb
	muls r4, r1, r4
	adds r1, r4, #0
	str r1, [r0, #0x50]
	movs r1, #0
	str r1, [r0, #0x2c]
	str r1, [r0, #0x30]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BD4BC: .4byte 0x08CEF444
_080BD4C0: .4byte 0x080C5A48
