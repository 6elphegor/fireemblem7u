	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802B46C
sub_0802B46C: @ 0x0802B46C
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldr r3, [r2, #0x14]
	adds r4, r3, #0
	adds r4, #0x41
	ldrb r0, [r4]
	lsls r1, r0, #2
	adds r0, r3, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	adds r5, r3, #0
	adds r5, #0x42
	ldrb r6, [r5]
	lsls r1, r6, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r6, [r0]
	cmp r6, #0
	bne _0802B49C
	adds r0, r2, #0
	bl Proc_End
	b _0802B502
_0802B49C:
	adds r0, r3, #0
	adds r0, #0x45
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802B4CA
	adds r2, r3, #0
	adds r2, #0x47
	adds r1, r3, #0
	adds r1, #0x46
	ldrb r7, [r1]
	lsls r0, r7, #1
	adds r1, r7, #0
	adds r0, r0, r1
	lsls r0, r0, #1
	ldrb r2, [r2]
	adds r0, r2, r0
	adds r1, r3, #0
	adds r1, #0x34
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
_0802B4CA:
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl LoadHelpBoxGfx
	ldr r0, _0802B508 @ =0x08B942B8
	ldrb r2, [r4]
	lsls r1, r2, #2
	adds r1, r1, r2
	ldrb r5, [r5]
	adds r1, r5, r1
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r7, #0
	ldrsh r0, [r1, r7]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	adds r2, r6, #0
	bl StartItemHelpBox
	ldr r0, _0802B50C @ =0x08B857F8
	ldr r1, [r0]
	ldr r0, _0802B510 @ =0x0000FEFD
	ldrh r6, [r1, #8]
	ands r0, r6
	strh r0, [r1, #8]
_0802B502:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B508: .4byte 0x08B942B8
_0802B50C: .4byte 0x08B857F8
_0802B510: .4byte 0x0000FEFD
