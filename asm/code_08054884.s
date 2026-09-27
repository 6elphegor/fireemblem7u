	.include "macro.inc"

	.syntax unified

	thumb_func_start SetAnimStateUnHidden
SetAnimStateUnHidden: @ 0x08054884
	push {r4, lr}
	cmp r0, #0
	bne _080548A4
	ldr r2, _0805489C @ =0x02000000
	ldr r3, [r2]
	ldr r1, _080548A0 @ =0x0000FFFD
	adds r0, r1, #0
	ldrh r4, [r3]
	ands r0, r4
	strh r0, [r3]
	ldr r3, [r2, #4]
	b _080548B8
	.align 2, 0
_0805489C: .4byte 0x02000000
_080548A0: .4byte 0x0000FFFD
_080548A4:
	cmp r0, #1
	bne _080548BE
	ldr r2, _080548C4 @ =0x02000000
	ldr r3, [r2, #8]
	ldr r1, _080548C8 @ =0x0000FFFD
	adds r0, r1, #0
	ldrh r4, [r3]
	ands r0, r4
	strh r0, [r3]
	ldr r3, [r2, #0xc]
_080548B8:
	ldrh r0, [r3]
	ands r1, r0
	strh r1, [r3]
_080548BE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080548C4: .4byte 0x02000000
_080548C8: .4byte 0x0000FFFD
