	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AE4CC
sub_080AE4CC: @ 0x080AE4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	cmp r0, #0xf
	bls _080AE4DA
	b _080AE6C8
_080AE4DA:
	lsls r0, r0, #2
	ldr r1, _080AE4E4 @ =_080AE4E8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AE4E4: .4byte _080AE4E8
_080AE4E8: @ jump table
	.4byte _080AE528 @ case 0
	.4byte _080AE590 @ case 1
	.4byte _080AE5A8 @ case 2
	.4byte _080AE5C0 @ case 3
	.4byte _080AE5D8 @ case 4
	.4byte _080AE5F0 @ case 5
	.4byte _080AE5FC @ case 6
	.4byte _080AE610 @ case 7
	.4byte _080AE628 @ case 8
	.4byte _080AE6C8 @ case 9
	.4byte _080AE640 @ case 10
	.4byte _080AE658 @ case 11
	.4byte _080AE670 @ case 12
	.4byte _080AE688 @ case 13
	.4byte _080AE69C @ case 14
	.4byte _080AE6B0 @ case 15
_080AE528:
	cmp r3, #1
	beq _080AE554
	cmp r3, #1
	bgt _080AE536
	cmp r3, #0
	beq _080AE540
	b _080AE590
_080AE536:
	cmp r3, #2
	beq _080AE568
	cmp r3, #3
	beq _080AE57C
	b _080AE590
_080AE540:
	ldr r1, _080AE550 @ =0x0202BBF8
	adds r1, #0x42
	movs r0, #7
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	b _080AE6C8
	.align 2, 0
_080AE550: .4byte 0x0202BBF8
_080AE554:
	ldr r1, _080AE564 @ =0x0202BBF8
	adds r1, #0x42
	movs r0, #6
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	b _080AE6C8
	.align 2, 0
_080AE564: .4byte 0x0202BBF8
_080AE568:
	ldr r0, _080AE578 @ =0x0202BBF8
	adds r0, #0x42
	movs r1, #7
	rsbs r1, r1, #0
	ldrb r2, [r0]
	ands r1, r2
	movs r2, #2
	b _080AE664
	.align 2, 0
_080AE578: .4byte 0x0202BBF8
_080AE57C:
	ldr r0, _080AE58C @ =0x0202BBF8
	adds r0, #0x42
	movs r1, #7
	rsbs r1, r1, #0
	ldrb r3, [r0]
	ands r1, r3
	movs r2, #4
	b _080AE664
	.align 2, 0
_080AE58C: .4byte 0x0202BBF8
_080AE590:
	ldr r2, _080AE5A4 @ =0x0202BBF8
	adds r2, #0x40
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #3
	rsbs r0, r0, #0
	b _080AE6C0
	.align 2, 0
_080AE5A4: .4byte 0x0202BBF8
_080AE5A8:
	ldr r2, _080AE5BC @ =0x0202BBF8
	adds r2, #0x40
	movs r0, #3
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #0xd
	rsbs r0, r0, #0
	b _080AE6C0
	.align 2, 0
_080AE5BC: .4byte 0x0202BBF8
_080AE5C0:
	ldr r2, _080AE5D4 @ =0x0202BBF8
	adds r2, #0x40
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #4
	movs r0, #0x11
	rsbs r0, r0, #0
	b _080AE6C0
	.align 2, 0
_080AE5D4: .4byte 0x0202BBF8
_080AE5D8:
	ldr r2, _080AE5EC @ =0x0202BBF8
	adds r2, #0x40
	movs r0, #3
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #5
	movs r0, #0x61
	rsbs r0, r0, #0
	b _080AE6C0
	.align 2, 0
_080AE5EC: .4byte 0x0202BBF8
_080AE5F0:
	ldr r0, _080AE5F8 @ =0x0202BBF8
	adds r0, #0x40
	b _080AE65C
	.align 2, 0
_080AE5F8: .4byte 0x0202BBF8
_080AE5FC:
	ldr r2, _080AE60C @ =0x0202BBF8
	adds r2, #0x41
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	movs r0, #2
	rsbs r0, r0, #0
	b _080AE6C0
	.align 2, 0
_080AE60C: .4byte 0x0202BBF8
_080AE610:
	ldr r2, _080AE624 @ =0x0202BBF8
	adds r2, #0x41
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #3
	rsbs r0, r0, #0
	b _080AE6C0
	.align 2, 0
_080AE624: .4byte 0x0202BBF8
_080AE628:
	ldr r2, _080AE63C @ =0x0202BBF8
	adds r2, #0x41
	movs r0, #3
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #0xd
	rsbs r0, r0, #0
	b _080AE6C0
	.align 2, 0
_080AE63C: .4byte 0x0202BBF8
_080AE640:
	ldr r2, _080AE654 @ =0x0202BBF8
	adds r2, #0x42
	movs r0, #3
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #3
	movs r0, #0x19
	rsbs r0, r0, #0
	b _080AE6C0
	.align 2, 0
_080AE654: .4byte 0x0202BBF8
_080AE658:
	ldr r0, _080AE66C @ =0x0202BBF8
	adds r0, #0x41
_080AE65C:
	lsls r2, r3, #7
	movs r1, #0x7f
	ldrb r3, [r0]
	ands r1, r3
_080AE664:
	orrs r1, r2
	strb r1, [r0]
	b _080AE6C8
	.align 2, 0
_080AE66C: .4byte 0x0202BBF8
_080AE670:
	ldr r2, _080AE684 @ =0x0202BBF8
	adds r2, #0x41
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #6
	movs r0, #0x41
	rsbs r0, r0, #0
	b _080AE6C0
	.align 2, 0
_080AE684: .4byte 0x0202BBF8
_080AE688:
	ldr r2, _080AE698 @ =0x0202BBF8
	adds r2, #0x40
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	movs r0, #2
	rsbs r0, r0, #0
	b _080AE6C0
	.align 2, 0
_080AE698: .4byte 0x0202BBF8
_080AE69C:
	ldr r2, _080AE6AC @ =0x0202BBF8
	adds r2, #0x42
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	movs r0, #2
	rsbs r0, r0, #0
	b _080AE6C0
	.align 2, 0
_080AE6AC: .4byte 0x0202BBF8
_080AE6B0:
	ldr r2, _080AE6CC @ =0x0202BBF8
	adds r2, #0x42
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #5
	movs r0, #0x21
	rsbs r0, r0, #0
_080AE6C0:
	ldrb r3, [r2]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_080AE6C8:
	bx lr
	.align 2, 0
_080AE6CC: .4byte 0x0202BBF8
