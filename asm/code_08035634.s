	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08035634
sub_08035634: @ 0x08035634
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x30
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0803564C @ =0x0203A85C
	ldrb r0, [r0, #0x11]
	cmp r0, #0x1b
	bne _08035654
	ldr r0, _08035650 @ =sub_08035790
	b _08035706
	.align 2, 0
_0803564C: .4byte 0x0203A85C
_08035650: .4byte sub_08035790
_08035654:
	ldr r0, _08035668 @ =0x0203A97C
	ldrb r0, [r0]
	cmp r0, #0xa
	bhi _08035708
	lsls r0, r0, #2
	ldr r1, _0803566C @ =_08035670
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08035668: .4byte 0x0203A97C
_0803566C: .4byte _08035670
_08035670: @ jump table
	.4byte _0803569C @ case 0
	.4byte _080356A4 @ case 1
	.4byte _080356B4 @ case 2
	.4byte _080356C4 @ case 3
	.4byte _080356D4 @ case 4
	.4byte _080356DC @ case 5
	.4byte _080356E4 @ case 6
	.4byte _080356EC @ case 7
	.4byte _080356F4 @ case 8
	.4byte _080356FC @ case 9
	.4byte _08035704 @ case 10
_0803569C:
	ldr r0, _080356A0 @ =sub_08035790
	b _08035706
	.align 2, 0
_080356A0: .4byte sub_08035790
_080356A4:
	ldr r0, _080356B0 @ =sub_08035790
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	bl sub_08035294
	b _08035708
	.align 2, 0
_080356B0: .4byte sub_08035790
_080356B4:
	adds r0, r4, #0
	bl sub_0803530C
	ldr r0, _080356C0 @ =AiEscapeAction
	b _08035706
	.align 2, 0
_080356C0: .4byte AiEscapeAction
_080356C4:
	adds r0, r4, #0
	bl sub_0803534C
	ldr r0, _080356D0 @ =AiWaitAndClearScreenAction
	b _08035706
	.align 2, 0
_080356D0: .4byte AiWaitAndClearScreenAction
_080356D4:
	ldr r0, _080356D8 @ =sub_08035398
	b _08035706
	.align 2, 0
_080356D8: .4byte sub_08035398
_080356DC:
	ldr r0, _080356E0 @ =AiStaffAction
	b _08035706
	.align 2, 0
_080356E0: .4byte AiStaffAction
_080356E4:
	ldr r0, _080356E8 @ =sub_08035458
	b _08035706
	.align 2, 0
_080356E8: .4byte sub_08035458
_080356EC:
	ldr r0, _080356F0 @ =sub_0803548C
	b _08035706
	.align 2, 0
_080356F0: .4byte sub_0803548C
_080356F4:
	ldr r0, _080356F8 @ =AiTalkAction
	b _08035706
	.align 2, 0
_080356F8: .4byte AiTalkAction
_080356FC:
	ldr r0, _08035700 @ =sub_080354D4
	b _08035706
	.align 2, 0
_08035700: .4byte sub_080354D4
_08035704:
	ldr r0, _08035710 @ =sub_080354FC
_08035706:
	str r0, [r4, #0x2c]
_08035708:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035710: .4byte sub_080354FC
