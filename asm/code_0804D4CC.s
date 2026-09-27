	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrEfxStatusClear
EkrEfxStatusClear: @ 0x0804D4CC
	ldr r1, _0804D528 @ =0x02017728
	movs r0, #0
	str r0, [r1]
	ldr r1, _0804D52C @ =0x0201772C
	str r0, [r1]
	ldr r1, _0804D530 @ =0x02017730
	str r0, [r1]
	ldr r1, _0804D534 @ =0x02017738
	str r0, [r1]
	ldr r1, _0804D538 @ =0x0201773C
	str r0, [r1]
	ldr r1, _0804D53C @ =0x02017740
	str r0, [r1]
	ldr r1, _0804D540 @ =0x02017748
	str r0, [r1]
	ldr r1, _0804D544 @ =0x0201774C
	str r0, [r1]
	ldr r1, _0804D548 @ =0x02017750
	str r0, [r1]
	ldr r1, _0804D54C @ =0x02017754
	str r0, [r1]
	ldr r1, _0804D550 @ =0x02017758
	str r0, [r1]
	ldr r1, _0804D554 @ =0x0201775C
	str r0, [r1]
	ldr r1, _0804D558 @ =0x02017760
	strh r0, [r1]
	strh r0, [r1, #2]
	ldr r1, _0804D55C @ =0x02017764
	strh r0, [r1]
	strh r0, [r1, #2]
	ldr r1, _0804D560 @ =0x02017768
	strh r0, [r1]
	strh r0, [r1, #2]
	ldr r1, _0804D564 @ =0x02017780
	strh r0, [r1]
	strh r0, [r1, #2]
	ldr r1, _0804D568 @ =0x0201776C
	str r0, [r1]
	str r0, [r1, #4]
	ldr r1, _0804D56C @ =0x02017778
	str r0, [r1]
	ldr r1, _0804D570 @ =0x0201777C
	str r0, [r1]
	bx lr
	.align 2, 0
_0804D528: .4byte 0x02017728
_0804D52C: .4byte 0x0201772C
_0804D530: .4byte 0x02017730
_0804D534: .4byte 0x02017738
_0804D538: .4byte 0x0201773C
_0804D53C: .4byte 0x02017740
_0804D540: .4byte 0x02017748
_0804D544: .4byte 0x0201774C
_0804D548: .4byte 0x02017750
_0804D54C: .4byte 0x02017754
_0804D550: .4byte 0x02017758
_0804D554: .4byte 0x0201775C
_0804D558: .4byte 0x02017760
_0804D55C: .4byte 0x02017764
_0804D560: .4byte 0x02017768
_0804D564: .4byte 0x02017780
_0804D568: .4byte 0x0201776C
_0804D56C: .4byte 0x02017778
_0804D570: .4byte 0x0201777C
