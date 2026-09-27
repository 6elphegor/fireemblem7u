	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809210C
sub_0809210C: @ 0x0809210C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08092174 @ =0x02022EBE
	movs r1, #0xc
	movs r2, #0x14
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_08091944
	movs r0, #0xc0
	lsls r0, r0, #6
	movs r1, #0xa
	bl sub_08091994
	adds r0, r6, #0
	bl sub_08092010
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r5, [r0]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x14
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	ldrh r0, [r6, #0x32]
	subs r0, #4
	subs r1, r1, r0
	adds r0, r4, #0
	bl sub_08092C34
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08092178
	bl BlockUiCursorHand
	b _0809217C
	.align 2, 0
_08092174: .4byte 0x02022EBE
_08092178:
	bl UnblockUiCursorHand
_0809217C:
	bl sub_08091914
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
