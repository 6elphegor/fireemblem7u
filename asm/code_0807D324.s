	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D324
sub_0807D324: @ 0x0807D324
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_0807D32A:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0807D342
	ldr r0, [r0]
	cmp r0, #0
	beq _0807D342
	ldrb r0, [r0, #4]
	bl PidStatsGetExpGain
	adds r5, r5, r0
_0807D342:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807D32A
	ldr r0, _0807D358 @ =0x03004ADC
	ldrh r0, [r0]
	subs r5, r5, r0
	ldr r0, _0807D35C @ =0x000002BB
	cmp r5, r0
	bgt _0807D360
	movs r0, #0
	b _0807D362
	.align 2, 0
_0807D358: .4byte 0x03004ADC
_0807D35C: .4byte 0x000002BB
_0807D360:
	movs r0, #1
_0807D362:
	pop {r4, r5}
	pop {r1}
	bx r1
