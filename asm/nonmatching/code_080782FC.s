	.include "macro.inc"

	.syntax unified

	thumb_func_start EvCheck02_TURN
EvCheck02_TURN: @ 0x080782FC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r2, [r4]
	ldr r1, [r2, #8]
	ldrb r6, [r2, #8]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r5, r0, #8
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r1, r0
	lsrs r7, r1, #0x10
	ldr r0, [r2, #0xc]
	subs r0, #1
	cmp r0, #4
	bhi _080783B0
	lsls r0, r0, #2
	ldr r1, _08078328 @ =_0807832C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08078328: .4byte _0807832C
_0807832C: @ jump table
	.4byte _08078340 @ case 0
	.4byte _08078350 @ case 1
	.4byte _08078368 @ case 2
	.4byte _08078380 @ case 3
	.4byte _08078398 @ case 4
_08078340:
	ldr r1, _0807834C @ =0x0202BBF8
	ldrb r0, [r1, #0x1b]
	cmp r0, #2
	bne _080783EC
	b _08078358
	.align 2, 0
_0807834C: .4byte 0x0202BBF8
_08078350:
	ldr r1, _08078364 @ =0x0202BBF8
	ldrb r2, [r1, #0x1b]
	cmp r2, #3
	bne _080783EC
_08078358:
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _080783A4
	b _080783EC
	.align 2, 0
_08078364: .4byte 0x0202BBF8
_08078368:
	ldr r1, _0807837C @ =0x0202BBF8
	movs r0, #0x40
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	beq _080783EC
	ldrb r1, [r1, #0x1b]
	cmp r1, #2
	beq _080783A4
	b _080783EC
	.align 2, 0
_0807837C: .4byte 0x0202BBF8
_08078380:
	ldr r1, _08078394 @ =0x0202BBF8
	movs r0, #0x40
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	beq _080783EC
	ldrb r1, [r1, #0x1b]
	cmp r1, #3
	beq _080783A4
	b _080783EC
	.align 2, 0
_08078394: .4byte 0x0202BBF8
_08078398:
	ldr r1, _080783C4 @ =0x0202BBF8
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _080783EC
_080783A4:
	movs r0, #2
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080783EC
_080783B0:
	cmp r5, #0
	bne _080783C8
	ldr r0, _080783C4 @ =0x0202BBF8
	ldrh r1, [r0, #0x10]
	cmp r1, r6
	bne _080783EC
	ldrb r0, [r0, #0xf]
	cmp r0, r7
	bne _080783EC
	b _080783DA
	.align 2, 0
_080783C4: .4byte 0x0202BBF8
_080783C8:
	ldr r1, _080783E8 @ =0x0202BBF8
	ldrh r0, [r1, #0x10]
	cmp r0, r6
	blt _080783EC
	cmp r0, r5
	bgt _080783EC
	ldrb r1, [r1, #0xf]
	cmp r1, r7
	bne _080783EC
_080783DA:
	ldr r0, [r4]
	ldr r1, [r0, #4]
	str r1, [r4, #4]
	ldrh r0, [r0, #2]
	str r0, [r4, #8]
	movs r0, #1
	b _080783EE
	.align 2, 0
_080783E8: .4byte 0x0202BBF8
_080783EC:
	movs r0, #0
_080783EE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
