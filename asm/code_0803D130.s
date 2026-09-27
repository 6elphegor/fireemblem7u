	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803D130
sub_0803D130: @ 0x0803D130
	push {r4, r5, r6, r7, lr}
	adds r2, r1, #0
	ldr r1, _0803D158 @ =0x030013E0
	ldr r0, _0803D15C @ =0x030013E8
	ldrh r3, [r1]
	ldrh r0, [r0]
	cmp r3, r0
	bne _0803D164
	ldr r7, _0803D160 @ =0x00007FFF
	adds r0, r7, #0
	strh r0, [r2]
	adds r2, #2
	strh r0, [r2]
	adds r2, #2
	strh r0, [r2]
	strh r0, [r2, #2]
	movs r0, #2
	rsbs r0, r0, #0
	b _0803D18E
	.align 2, 0
_0803D158: .4byte 0x030013E0
_0803D15C: .4byte 0x030013E8
_0803D160: .4byte 0x00007FFF
_0803D164:
	movs r4, #0
	ldr r6, _0803D194 @ =0x0203C90C
	ldr r5, _0803D198 @ =0x000001FF
	adds r3, r1, #0
_0803D16C:
	lsls r0, r4, #1
	ldrh r7, [r3]
	lsls r1, r7, #3
	adds r0, r0, r1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r3]
	adds r0, #1
	ands r0, r5
	strh r0, [r3]
	adds r3, #2
	adds r4, #1
	cmp r4, #3
	ble _0803D16C
	movs r0, #0
_0803D18E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803D194: .4byte 0x0203C90C
_0803D198: .4byte 0x000001FF
