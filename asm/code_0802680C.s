	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitSupportNumByPid
GetUnitSupportNumByPid: @ 0x0802680C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	bl GetUnitSupporterCount
	adds r5, r0, #0
	movs r4, #0
	cmp r4, r5
	bge _0802683A
_08026820:
	adds r0, r6, #0
	adds r1, r4, #0
	bl GetUnitSupportPid
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r7
	bne _08026834
	adds r0, r4, #0
	b _0802683E
_08026834:
	adds r4, #1
	cmp r4, r5
	blt _08026820
_0802683A:
	movs r0, #1
	rsbs r0, r0, #0
_0802683E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
