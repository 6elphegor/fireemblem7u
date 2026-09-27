	.include "macro.inc"

	.syntax unified

	thumb_func_start ClassInfoDisplay_LoopScript
ClassInfoDisplay_LoopScript: @ 0x080AFFC4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #7
	bhi _080B003C
	lsls r0, r0, #2
	ldr r1, _080AFFDC @ =_080AFFE0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AFFDC: .4byte _080AFFE0
_080AFFE0: @ jump table
	.4byte _080B0000 @ case 0
	.4byte _080B0000 @ case 1
	.4byte _080B0000 @ case 2
	.4byte _080B0000 @ case 3
	.4byte _080B0006 @ case 4
	.4byte _080B0000 @ case 5
	.4byte _080B0000 @ case 6
	.4byte _080B0024 @ case 7
_080B0000:
	ldr r0, [r4, #0x38]
	adds r0, #2
	b _080B001A
_080B0006:
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	strh r0, [r4, #0x2a]
	ldr r1, [r4, #0x38]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r2, [r1, #1]
	cmp r0, r2
	blo _080B003C
	adds r0, r1, #2
_080B001A:
	str r0, [r4, #0x38]
	adds r0, r4, #0
	bl Proc_Break
	b _080B003C
_080B0024:
	ldr r0, _080B0044 @ =0x02000040
	bl sub_08054E3C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B003C
	ldr r0, [r4, #0x38]
	adds r0, #2
	str r0, [r4, #0x38]
	adds r0, r4, #0
	bl Proc_Break
_080B003C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B0044: .4byte 0x02000040
