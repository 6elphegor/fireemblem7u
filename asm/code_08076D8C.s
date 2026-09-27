	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08076D8C
sub_08076D8C: @ 0x08076D8C
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _08076DB4 @ =0x0203E660
	ldr r1, [r0, #4]
	adds r0, r1, #0
	bl InitScanlineBuf
_08076DA4:
	ldr r0, [r7, #0x1c]
	ldrb r1, [r0]
	cmp r1, #0xff
	beq _08076DB8
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _08076DBA
	b _08076DB8
	.align 2, 0
_08076DB4: .4byte 0x0203E660
_08076DB8:
	b _08076E08
_08076DBA:
	ldr r0, [r7, #0x1c]
	ldrb r1, [r0]
	ldr r2, [r7, #8]
	adds r0, r1, #0
	muls r0, r2, r0
	ldr r1, [r7, #0xc]
	bl Div
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x1c]
	adds r1, r0, #1
	str r1, [r7, #0x1c]
	ldr r0, [r7, #0x10]
	cmp r0, #0
	ble _08076DFA
	ldr r1, _08076E04 @ =0x0203E660
	ldr r0, [r1, #4]
	ldr r1, [r7]
	ldr r3, [r7, #0x10]
	adds r2, r1, r3
	subs r1, r2, #1
	ldr r2, [r7, #4]
	bl SetScanlineBufWinR
	ldr r1, _08076E04 @ =0x0203E660
	ldr r0, [r1, #4]
	ldr r1, [r7]
	ldr r2, [r7, #0x10]
	subs r1, r1, r2
	ldr r2, [r7, #4]
	bl SetScanlineBufWinL
_08076DFA:
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _08076DA4
	.align 2, 0
_08076E04: .4byte 0x0203E660
_08076E08:
	ldr r0, [r7, #0x10]
	cmp r0, #0
	ble _08076E44
_08076E0E:
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _08076E16
	b _08076E44
_08076E16:
	ldr r1, _08076E40 @ =0x0203E660
	ldr r0, [r1, #4]
	ldr r1, [r7]
	ldr r3, [r7, #0x10]
	adds r2, r1, r3
	subs r1, r2, #1
	ldr r2, [r7, #4]
	bl SetScanlineBufWinR
	ldr r1, _08076E40 @ =0x0203E660
	ldr r0, [r1, #4]
	ldr r1, [r7]
	ldr r2, [r7, #0x10]
	subs r1, r1, r2
	ldr r2, [r7, #4]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _08076E0E
	.align 2, 0
_08076E40: .4byte 0x0203E660
_08076E44:
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
