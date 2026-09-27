	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804E77C
sub_0804E77C: @ 0x0804E77C
	push {r4, lr}
	adds r2, r0, #0
	ldr r3, [r2, #0x44]
	movs r1, #0x2c
	ldrsh r0, [r2, r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r4, [r0]
	ldr r1, _0804E7AC @ =0x00007FFF
	cmp r4, r1
	beq _0804E7B4
	ldr r1, _0804E7B0 @ =0x02017760
	strh r4, [r1]
	movs r4, #0x2c
	ldrsh r0, [r2, r4]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0, #2]
	strh r0, [r1, #2]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	b _0804E7E0
	.align 2, 0
_0804E7AC: .4byte 0x00007FFF
_0804E7B0: .4byte 0x02017760
_0804E7B4:
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804E7C4
	cmp r0, #1
	beq _0804E7D8
	b _0804E7E0
_0804E7C4:
	strh r0, [r2, #0x2c]
	ldr r0, _0804E7D4 @ =0x02017760
	ldrh r1, [r3]
	strh r1, [r0]
	ldrh r1, [r3, #2]
	strh r1, [r0, #2]
	b _0804E7E0
	.align 2, 0
_0804E7D4: .4byte 0x02017760
_0804E7D8:
	ldr r1, _0804E7E8 @ =0x02017760
	movs r0, #0
	strh r0, [r1, #2]
	strh r0, [r1]
_0804E7E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804E7E8: .4byte 0x02017760
