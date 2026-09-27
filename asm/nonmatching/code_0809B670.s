	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809B670
sub_0809B670: @ 0x0809B670
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0809B6F8
	str r0, [r4, #0x38]
	str r1, [r4, #0x3c]
	movs r1, #3
	bl __divsi3
	adds r1, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bge _0809B692
	adds r0, #0xf
_0809B692:
	asrs r0, r0, #4
	subs r0, r1, r0
	lsls r0, r0, #4
	adds r0, #0x4c
	cmp r0, #0x4c
	bgt _0809B6AC
	cmp r1, #0
	bne _0809B6A6
	str r1, [r4, #0x34]
	b _0809B6AC
_0809B6A6:
	subs r0, r1, #1
	lsls r0, r0, #4
	str r0, [r4, #0x34]
_0809B6AC:
	ldr r0, [r4, #0x38]
	movs r1, #3
	bl __divsi3
	adds r5, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bge _0809B6BE
	adds r0, #0xf
_0809B6BE:
	asrs r0, r0, #4
	subs r0, r5, r0
	lsls r0, r0, #4
	adds r0, #0x4c
	cmp r0, #0x7b
	ble _0809B6F8
	bl GetSupportScreenUnitCount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	cmp r5, r0
	bne _0809B6EA
	bl GetSupportScreenUnitCount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	subs r0, #3
	b _0809B6F4
_0809B6EA:
	ldr r0, [r4, #0x38]
	movs r1, #3
	bl __divsi3
	subs r0, #2
_0809B6F4:
	lsls r0, r0, #4
	str r0, [r4, #0x34]
_0809B6F8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
