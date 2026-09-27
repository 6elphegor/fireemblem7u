	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809D2D4
sub_0809D2D4: @ 0x0809D2D4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	movs r0, #0x3a
	adds r0, r0, r7
	mov sb, r0
	ldrb r0, [r0]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	mov r1, sb
	strb r0, [r1]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	adds r6, r0, #0
	movs r5, #8
	subs r6, r5, r6
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	subs r5, r5, r6
	lsls r5, r5, #3
	str r5, [r7, #0x30]
	subs r6, #8
	adds r0, r6, #0
	bl sub_0809D15C
	ldr r1, [r7, #0x30]
	adds r1, #0x38
	ldr r0, _0809D378 @ =0x000001FF
	ands r1, r0
	adds r0, r7, #0
	adds r0, #0x3f
	ldrb r2, [r0]
	movs r0, #0
	bl SetFacePosition
	ldr r3, _0809D37C @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x10
	subs r0, r0, r4
	adds r1, r3, #0
	adds r1, #0x44
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	mov r1, r8
	strb r1, [r0]
	mov r0, sb
	ldrb r0, [r0]
	cmp r0, #0xa
	bne _0809D36A
	adds r0, r7, #0
	bl Proc_Break
_0809D36A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D378: .4byte 0x000001FF
_0809D37C: .4byte 0x03002870
