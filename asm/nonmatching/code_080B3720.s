	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B3720
sub_080B3720: @ 0x080B3720
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r3, r0, #0
	ldr r0, [r3, #0x2c]
	adds r0, #1
	str r0, [r3, #0x2c]
	asrs r4, r0, #2
	ldr r2, _080B37A0 @ =0x03002870
	adds r6, r2, #0
	adds r6, #0x3c
	movs r0, #0x3f
	mov sl, r0
	ldrb r1, [r6]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r6]
	movs r0, #0x10
	subs r0, r0, r4
	movs r1, #0x44
	adds r1, r1, r2
	mov sb, r1
	movs r5, #0
	strb r0, [r1]
	movs r0, #0x45
	adds r0, r0, r2
	mov r8, r0
	strb r4, [r0]
	adds r7, r2, #0
	adds r7, #0x46
	strb r5, [r7]
	cmp r4, #0x10
	bne _080B3792
	adds r0, r3, #0
	bl Proc_Break
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	mov r0, sl
	ldrb r1, [r6]
	ands r0, r1
	strb r0, [r6]
	mov r0, sb
	strb r4, [r0]
	mov r1, r8
	strb r5, [r1]
	strb r5, [r7]
_080B3792:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B37A0: .4byte 0x03002870
