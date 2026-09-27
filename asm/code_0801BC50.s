	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801BC50
sub_0801BC50: @ 0x0801BC50
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #1
	beq _0801BC5E
	movs r0, #8
	b _0801BC78
_0801BC5E:
	ldr r0, _0801BC7C @ =0x08B92AF8
	bl Proc_Find
	cmp r0, #0
	beq _0801BC6C
	bl EndMapMain
_0801BC6C:
	movs r0, #4
	bl ReadSuspendSave
	bl sub_08012BAC
	movs r0, #0x17
_0801BC78:
	pop {r1}
	bx r1
	.align 2, 0
_0801BC7C: .4byte 0x08B92AF8
