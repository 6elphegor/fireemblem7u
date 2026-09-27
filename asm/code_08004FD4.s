	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08004FD4
sub_08004FD4: @ 0x08004FD4
	push {r4, r5, r6, lr}
	movs r1, #0
	ldr r2, _08005010 @ =0x02026D30
	ldr r6, _08005014 @ =0x02023C60
	movs r5, #0xff
	adds r4, r2, #0
	adds r4, #0x14
	movs r3, #0
_08004FE4:
	adds r0, r1, #0
	ands r0, r5
	lsls r0, r0, #5
	adds r0, r0, r4
	strb r3, [r0]
	adds r1, #1
	cmp r1, #0xff
	ble _08004FE4
	movs r0, #0
	str r0, [r2, #8]
	str r0, [r2, #0xc]
	adds r0, r6, #0
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08005010: .4byte 0x02026D30
_08005014: .4byte 0x02023C60
