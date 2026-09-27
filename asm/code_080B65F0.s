	.include "macro.inc"

	.syntax unified

	thumb_func_start GetOverallRank
GetOverallRank: @ 0x080B65F0
	push {r4, r5, r6, lr}
	ldr r6, [sp, #0x10]
	ldr r4, _080B6634 @ =0x08CED678
	adds r0, r0, r4
	adds r5, r4, #5
	adds r1, r1, r5
	ldrb r0, [r0]
	ldrb r1, [r1]
	adds r1, r0, r1
	adds r0, r4, #0
	adds r0, #0xa
	adds r2, r2, r0
	ldrb r2, [r2]
	adds r1, r2, r1
	adds r0, #5
	adds r3, r3, r0
	ldrb r3, [r3]
	adds r1, r3, r1
	adds r4, #0x14
	adds r6, r6, r4
	ldrb r6, [r6]
	adds r1, r6, r1
	movs r0, #0
	ldr r2, _080B6638 @ =0x08CED692
_080B6620:
	ldrh r3, [r2]
	cmp r1, r3
	blo _080B662E
	adds r2, #2
	adds r0, #1
	cmp r0, #4
	ble _080B6620
_080B662E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080B6634: .4byte 0x08CED678
_080B6638: .4byte 0x08CED692
