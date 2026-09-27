	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809FD9C
sub_0809FD9C: @ 0x0809FD9C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	cmp r4, #0x45
	bhi _0809FDEE
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _0809FDEE
	lsls r1, r4, #4
	ldr r0, _0809FDF4 @ =0x0203E790
	adds r2, r1, r0
	cmp r2, #0
	beq _0809FDEE
	movs r3, #3
	adds r0, r3, #0
	ldrb r1, [r2, #0xc]
	ands r0, r1
	lsls r1, r0, #8
	ldrb r0, [r2, #0xb]
	orrs r1, r0
	ldr r0, _0809FDF8 @ =0x000003E7
	cmp r1, r0
	bgt _0809FDE6
	adds r1, #1
	strb r1, [r2, #0xb]
	lsrs r1, r1, #8
	ands r1, r3
	movs r0, #4
	rsbs r0, r0, #0
	ldrb r3, [r2, #0xc]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #0xc]
_0809FDE6:
	adds r0, r5, #0
	movs r1, #0x10
	bl PidStatsAddFavval
_0809FDEE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809FDF4: .4byte 0x0203E790
_0809FDF8: .4byte 0x000003E7
