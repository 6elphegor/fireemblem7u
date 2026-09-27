	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08005134
sub_08005134: @ 0x08005134
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4]
	ldr r1, _08005150 @ =0x02026D30
	mov ip, r1
	cmp r0, #0
	beq _08005186
	mov r3, ip
_08005144:
	ldrb r2, [r4]
	ldr r0, [r3, #8]
	cmp r0, #0x30
	bne _08005154
	movs r2, #0
	b _08005156
	.align 2, 0
_08005150: .4byte 0x02026D30
_08005154:
	adds r4, #1
_08005156:
	cmp r2, #0xa
	bne _0800515C
	movs r2, #0
_0800515C:
	ldrb r0, [r3, #0xc]
	lsls r1, r0, #5
	ldr r0, [r3, #8]
	adds r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x14
	adds r0, r0, r1
	strb r2, [r0]
	ldr r0, [r3, #8]
	adds r0, #1
	str r0, [r3, #8]
	cmp r2, #0
	bne _08005180
	mov r1, ip
	str r2, [r1, #8]
	ldr r0, [r1, #0xc]
	adds r0, #1
	str r0, [r1, #0xc]
_08005180:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08005144
_08005186:
	mov r2, ip
	ldr r0, [r2, #0x10]
	adds r0, #0x14
	ldr r1, [r2, #0xc]
	cmp r1, r0
	bls _08005198
	adds r0, r1, #0
	subs r0, #0x14
	str r0, [r2, #0x10]
_08005198:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
