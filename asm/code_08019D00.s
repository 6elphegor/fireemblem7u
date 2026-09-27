	.include "macro.inc"

	.syntax unified

	thumb_func_start BeginMapFlood
BeginMapFlood: @ 0x08019D00
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r7, r1, #0
	ldr r1, _08019D20 @ =0x030046A0
	ldr r0, _08019D24 @ =0x030041F0
	str r0, [r1, #4]
	ldr r0, _08019D28 @ =0x03004490
	str r0, [r1]
	strb r2, [r1, #9]
	adds r6, r1, #0
	cmp r3, #0
	bne _08019D2C
	strb r3, [r6, #8]
	b _08019D32
	.align 2, 0
_08019D20: .4byte 0x030046A0
_08019D24: .4byte 0x030041F0
_08019D28: .4byte 0x03004490
_08019D2C:
	movs r0, #1
	strb r0, [r6, #8]
	strb r3, [r6, #0xa]
_08019D32:
	movs r0, #0
	mov r8, r0
	movs r0, #0x78
	strb r0, [r6, #0xb]
	ldr r4, _08019D80 @ =0x030041E0
	ldr r0, [r4]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, [r6, #4]
	strb r5, [r0]
	ldr r0, [r6, #4]
	strb r7, [r0, #1]
	ldr r1, [r6, #4]
	movs r0, #5
	strb r0, [r1, #2]
	ldr r0, [r6, #4]
	mov r1, r8
	strb r1, [r0, #3]
	ldr r1, [r4]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r5
	mov r1, r8
	strb r1, [r0]
	ldr r0, [r6, #4]
	adds r0, #4
	str r0, [r6, #4]
	movs r1, #4
	strb r1, [r0, #2]
	bl MapFloodCoreRam
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019D80: .4byte 0x030041E0
