	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08006028
sub_08006028: @ 0x08006028
	push {r4, r5, lr}
	adds r4, r0, #0
	mov ip, r1
	adds r5, r2, #0
	ldr r0, _0800604C @ =0x02028D70
	ldr r1, [r0]
	ldrb r2, [r4, #4]
	ldrb r3, [r4, #6]
	adds r0, r3, #0
	muls r0, r2, r0
	ldrh r3, [r4]
	adds r0, r3, r0
	lsls r0, r0, #1
	ldrh r1, [r1, #0x10]
	adds r1, r1, r0
	movs r3, #0
	b _08006062
	.align 2, 0
_0800604C: .4byte 0x02028D70
_08006050:
	mov r0, ip
	strh r1, [r0]
	adds r1, #1
	adds r0, #0x40
	strh r1, [r0]
	adds r1, #1
	movs r0, #2
	add ip, r0
	adds r3, #1
_08006062:
	cmp r3, r2
	bge _0800606A
	cmp r3, r5
	blt _08006050
_0800606A:
	movs r0, #5
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0800607A
	movs r0, #1
	ldrb r1, [r4, #6]
	eors r0, r1
	strb r0, [r4, #6]
_0800607A:
	pop {r4, r5}
	pop {r0}
	bx r0
