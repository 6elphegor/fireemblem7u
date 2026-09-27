	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08040B80
sub_08040B80: @ 0x08040B80
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r0, _08040C18 @ =0x000003C7
	movs r1, #1
	bl PutSioText
	ldr r0, _08040C1C @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08040C04
	bl GetGameTime
	ldr r7, _08040C20 @ =0x0203D90C
	adds r4, r7, #0
	adds r4, #0xa0
	ldrb r1, [r4]
	bl __umodsi3
	adds r5, r6, #0
	adds r5, #0x3b
	strb r0, [r5]
	bl RandNextB
	movs r1, #3
	ands r1, r0
	adds r1, #4
	ldrb r4, [r4]
	adds r3, r4, #0
	muls r3, r1, r3
	ldrb r0, [r5]
	adds r3, r0, r3
	adds r0, r6, #0
	adds r0, #0x39
	strb r3, [r0]
	mov r2, sp
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r7, r1
	ldrb r1, [r0]
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	strb r0, [r2]
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1f
	strb r0, [r2, #1]
	mov r0, sp
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1f
	strb r1, [r0, #2]
	mov r1, sp
	ldrb r0, [r5]
	strb r0, [r1, #3]
	mov r0, sp
	strb r3, [r0, #4]
	adds r0, #6
	bl RandGetSt
	mov r0, sp
	movs r1, #0x10
	bl SioEmitData
	str r0, [r6, #0x34]
_08040C04:
	adds r0, r6, #0
	adds r0, #0x3a
	movs r1, #0
	strb r1, [r0]
	subs r0, #2
	strb r1, [r0]
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040C18: .4byte 0x000003C7
_08040C1C: .4byte 0x08B98AEC
_08040C20: .4byte 0x0203D90C
