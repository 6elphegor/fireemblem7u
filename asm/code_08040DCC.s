	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08040DCC
sub_08040DCC: @ 0x08040DCC
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	strb r4, [r5, #9]
	movs r1, #0
	bl SetUnitStatus
	strb r4, [r5, #0x1b]
	ldr r1, _08040DF8 @ =0x0203D90C
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r1, r0
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08040DFC
	adds r0, r5, #0
	bl sub_0803DD40
	b _08040E02
	.align 2, 0
_08040DF8: .4byte 0x0203D90C
_08040DFC:
	adds r0, r5, #0
	bl sub_08048E0C
_08040E02:
	pop {r4, r5}
	pop {r0}
	bx r0
