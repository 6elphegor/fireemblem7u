	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08090F30
sub_08090F30: @ 0x08090F30
	push {r4, r5, lr}
	movs r1, #0
	ldr r4, _08090F5C @ =0x0202BC39
	ldr r2, _08090F60 @ =0x02012970
	ldr r3, _08090F64 @ =0x0840DD24
_08090F3A:
	ldrb r5, [r4]
	lsls r0, r5, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #4
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0xf
	ble _08090F3A
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08090F5C: .4byte 0x0202BC39
_08090F60: .4byte 0x02012970
_08090F64: .4byte 0x0840DD24
