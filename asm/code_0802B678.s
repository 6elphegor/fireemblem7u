	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802B678
sub_0802B678: @ 0x0802B678
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, _0802B6D0 @ =0x08B942F8
	movs r1, #3
	bl Proc_Start
	adds r2, r0, #0
	str r6, [r2, #0x2c]
	str r4, [r2, #0x30]
	adds r1, r2, #0
	adds r1, #0x40
	movs r0, #0
	strb r0, [r1]
	adds r5, r2, #0
	adds r5, #0x41
	strb r0, [r5]
	adds r1, #2
	strb r0, [r1]
	adds r4, r2, #0
	adds r4, #0x48
	strb r0, [r4]
	ldr r0, _0802B6D4 @ =0x0203A514
	str r2, [r0]
	bl sub_08079A5C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802B6BC
	movs r0, #0xc9
	bl SetkeyStIgnoredMask
	movs r0, #1
	strb r0, [r4]
_0802B6BC:
	adds r0, r6, #0
	bl GetUnitItemCount
	cmp r0, #0
	bne _0802B6CA
	movs r0, #1
	strb r0, [r5]
_0802B6CA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802B6D0: .4byte 0x08B942F8
_0802B6D4: .4byte 0x0203A514
