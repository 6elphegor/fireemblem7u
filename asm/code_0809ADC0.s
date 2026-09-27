	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809ADC0
sub_0809ADC0: @ 0x0809ADC0
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkChoiceResult
	cmp r0, #1
	bne _0809ADD6
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _0809ADDE
_0809ADD6:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_0809ADDE:
	pop {r4}
	pop {r0}
	bx r0
